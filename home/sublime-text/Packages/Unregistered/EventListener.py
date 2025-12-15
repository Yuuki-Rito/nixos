import sublime_plugin

class LicenseWindowKiller(sublime_plugin.EventListener):
    def on_new_window(self, window):
        window.run_command("close")