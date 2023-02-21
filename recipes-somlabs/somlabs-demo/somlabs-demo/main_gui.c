#include <stdbool.h>
#include <gtk/gtk.h>
#include <gdk/gdk.h>
#include <gdk/gdkwayland.h>
#include <gst/gst.h>
#include <gst/video/videooverlay.h>

#define VIDEO_URI "file:///usr/share/somlabs-demo/example_video.mp4"
#define VIDEO_WIDTH 600
#define VIDEO_HEIGHT 360

GstElement* pipeline;
GtkWidget* videoWidget;
GtkLabel* usageLabel;
bool videoContextSet = false;
unsigned long int time1old;
unsigned long int time2old;
unsigned long int time3old;
unsigned long int time4old;

char* ledPath;

static void on_about_to_finish(GstElement* playbin, gpointer user_data)
{
    gst_element_seek(pipeline, 1.0, GST_FORMAT_TIME, (GstSeekFlags)GST_SEEK_FLAG_FLUSH,
                     GST_SEEK_TYPE_SET, 0, GST_SEEK_TYPE_NONE, GST_CLOCK_TIME_NONE);
}

gboolean gst_is_wayland_display_handle_need_context_message(GstMessage * msg)
{
    const gchar *type = NULL;

    g_return_val_if_fail (GST_IS_MESSAGE (msg), FALSE);

    if (GST_MESSAGE_TYPE (msg) == GST_MESSAGE_NEED_CONTEXT &&
        gst_message_parse_context_type (msg, &type)) {
        return !g_strcmp0 (type, "GstWaylandDisplayHandleContextType");
  }

  return FALSE;
}

static GstBusSyncReply bus_sync_handler(GstBus* bus, GstMessage* message, gpointer user_data)
{
    if(gst_is_wayland_display_handle_need_context_message(message) && !videoContextSet) {
        GstContext* context = NULL;
        GdkDisplay* display = NULL;
        struct wl_display* display_handle = NULL;

        display = gtk_widget_get_display(videoWidget);
        display_handle = gdk_wayland_display_get_wl_display(display);

        context = gst_context_new("GstWaylandDisplayHandleContextType", TRUE);
        gst_structure_set (gst_context_writable_structure (context),
             "handle", G_TYPE_POINTER, display_handle, NULL);

        gst_element_set_context(GST_ELEMENT(GST_MESSAGE_SRC(message)), context);
        gst_context_unref(context);
        gst_message_unref(message);
        videoContextSet = true;
        return GST_BUS_DROP;

    } else if (gst_is_video_overlay_prepare_window_handle_message(message)) {
        GtkAllocation allocation;
        GdkWindow* window;
        struct wl_surface* window_handle;

        GstVideoOverlay* overlay = GST_VIDEO_OVERLAY(GST_MESSAGE_SRC(message));
        
	gtk_widget_get_allocation(videoWidget, &allocation);
        window = gtk_widget_get_window(videoWidget);
        window_handle = gdk_wayland_window_get_wl_surface(window);

        gst_video_overlay_set_window_handle(overlay, (guintptr)window_handle);
        gst_video_overlay_set_render_rectangle(overlay, allocation.x, allocation.y,
            allocation.width, allocation.height);

        gst_message_unref(message);
        return GST_BUS_DROP;

    }

    return GST_BUS_PASS;
}

void startPlay(char* filePath) {
    pipeline = gst_parse_launch("playbin video-sink=waylandsink flags=0x1", NULL);
    g_object_set(pipeline, "uri", VIDEO_URI, NULL);

    g_signal_connect (pipeline, "about-to-finish", G_CALLBACK(on_about_to_finish), NULL);

    GstBus* bus = gst_pipeline_get_bus(GST_PIPELINE (pipeline));
    gst_bus_add_signal_watch(bus);
    gst_bus_set_sync_handler(bus, bus_sync_handler, NULL, NULL);
    gst_object_unref(bus);

    gst_element_set_state(pipeline, GST_STATE_PLAYING);
}

gboolean timerTimeout(gpointer user_data) 
{
    char cpu[8];
    unsigned long int time1;
    unsigned long int time2;
    unsigned long int time3;
    unsigned long int time4;

    FILE *f = fopen("/proc/stat", "rt");
    fscanf(f, "%s %lu %lu %lu %lu", cpu, &time1, &time2, &time3, &time4);
    fclose(f);

    double busyTime = (time1 - time1old) + (time2 - time2old) + (time3 - time3old);
    double totalTime = busyTime + (time4 - time4old);
    int usage = (busyTime / totalTime) * 100.0;

    char text[8];
    sprintf(text, "%d%%", usage);

    gtk_label_set_text(usageLabel, text);

    time1old = time1;
    time2old = time2;
    time3old = time3;
    time4old = time4;

    return true;
}

void on_ledButton_clicked(GtkButton* button, gpointer user_data)
{

    char ledCmd[128];
    static bool ledOn = false;

    if(ledOn) {
        sprintf(ledCmd, "echo 0 > %s/brightness", ledPath);
        ledOn = false;
        system(ledCmd);
    } else {
        sprintf(ledCmd, "echo 1 > %s/brightness", ledPath);
        ledOn = true;
        system(ledCmd);
    }
}

void on_closeButton_clicked(GtkButton* button, gpointer user_data)
{
    gtk_window_close(GTK_WINDOW(user_data));
}

void on_mainWindow_destroy()
{
    gtk_main_quit();
}

int getMonitorNum(char* connectorName)
{
    GdkScreen* screen = gdk_screen_get_default();
    gint monitors = gdk_screen_get_n_monitors(screen);

    for(int i = 0; i < monitors; i++) {
        gchar* con = gdk_screen_get_monitor_plug_name(screen, i);
        if(strstr(con, connectorName) > 0)
            return i;
    }
    return -1;
}

int main(int argc, char* argv[])
{
    GtkBuilder* builder; 
    GtkWidget *button;

    bool hasLed = false;

    if(argc == 2) {
        hasLed = true;
        ledPath = argv[1];
    }

    gtk_init(&argc, &argv);
    gst_init(&argc, &argv);

    int currentMonitorNum = 0;
    int hdmiMonitorNum = getMonitorNum("HDMI");
    int dsiMonitorNum = getMonitorNum("DSI");
    if(hdmiMonitorNum >= 0)
        currentMonitorNum = hdmiMonitorNum;
    else if(dsiMonitorNum >= 0)
        currentMonitorNum = dsiMonitorNum;

    GtkCssProvider* cssProvider = gtk_css_provider_new();
    gtk_css_provider_load_from_path(cssProvider, "/usr/share/somlabs-demo/theme.css", NULL);
    gtk_style_context_add_provider_for_screen(
        gdk_screen_get_default(), GTK_STYLE_PROVIDER(cssProvider), GTK_STYLE_PROVIDER_PRIORITY_USER);

    GdkScreen* screen = gdk_screen_get_default();
    GtkWidget* window = gtk_window_new(GTK_WINDOW_TOPLEVEL);
    gtk_window_fullscreen_on_monitor(GTK_WINDOW(window), screen, currentMonitorNum);
    gtk_window_set_decorated(GTK_WINDOW(window), false);
    GtkStyleContext* context = gtk_widget_get_style_context(window);
    gtk_style_context_add_class(context, "window_style");
    g_signal_connect(G_OBJECT(window), "destroy", G_CALLBACK(on_mainWindow_destroy), NULL);

    GdkRectangle geometry = {0};
    gdk_screen_get_monitor_geometry(screen, currentMonitorNum, &geometry);

    int screenWidth = geometry.width;
    int screenHeight = geometry.height;

    printf("SIZE %dx%d\n", screenWidth, screenHeight);

    GtkWidget* fixedLayout = gtk_fixed_new();
    gtk_container_add(GTK_CONTAINER(window), fixedLayout);

    int videoWidth = VIDEO_WIDTH;
    int videoHeight = VIDEO_HEIGHT;

    if (screenWidth < 1000) {
        videoWidth *= 0.8;
	videoHeight *= 0.8;
    }

    int videoY = (screenHeight - videoHeight) * 0.1;
    int videoX = (screenWidth - videoWidth) * 0.5;

    int buttonHeight = (screenHeight - videoHeight - videoY) * 0.3;
    int buttonWidth = screenWidth * 0.25;

    int buttonY = buttonHeight + videoY + videoHeight;

    int ledButtonX = 0;
    int closeButtonX = 0;

    if (hasLed) {
        ledButtonX = screenWidth * 0.125;
        closeButtonX = screenWidth * 0.625;
    } else {
        closeButtonX = screenWidth * 0.375;
    }

    if (hasLed) {
        GtkWidget* ledButton = gtk_button_new_with_label("LED");
        gtk_fixed_put(GTK_FIXED(fixedLayout), ledButton, ledButtonX, buttonY);
        gtk_widget_set_size_request(ledButton, buttonWidth, buttonHeight);
        context = gtk_widget_get_style_context(ledButton);
        gtk_style_context_add_class(context, "button_style");
        g_signal_connect(ledButton, "clicked", G_CALLBACK(on_ledButton_clicked), NULL);
    }

    GtkWidget* closeButton = gtk_button_new_with_label("Close");
    gtk_fixed_put(GTK_FIXED(fixedLayout), closeButton, closeButtonX, buttonY);
    gtk_widget_set_size_request(closeButton, buttonWidth, buttonHeight);
    context = gtk_widget_get_style_context(closeButton);
    gtk_style_context_add_class(context, "button_style");
    g_signal_connect(closeButton, "clicked", G_CALLBACK(on_closeButton_clicked), window);

    videoWidget = gtk_frame_new(NULL);
    gtk_fixed_put(GTK_FIXED(fixedLayout), videoWidget, videoX, videoY);
    gtk_widget_set_size_request(videoWidget, videoWidth, videoHeight);

    GtkWidget* textLabel = gtk_label_new("CPU usage:");
    gtk_fixed_put(GTK_FIXED(fixedLayout), textLabel, 10, 10);
    gtk_widget_set_size_request(textLabel, 100, 40);
    context = gtk_widget_get_style_context(textLabel);
    gtk_style_context_add_class(context, "label_style");

    usageLabel = gtk_label_new("");
    gtk_fixed_put(GTK_FIXED(fixedLayout), usageLabel, 100, 10);
    gtk_widget_set_size_request(usageLabel, 50, 40);
    context = gtk_widget_get_style_context(usageLabel);
    gtk_style_context_add_class(context, "label_style");

    gtk_widget_show_all(window);

    startPlay(NULL);

    g_timeout_add_seconds(2, timerTimeout, NULL);

    gtk_main();

    return 0;
}
