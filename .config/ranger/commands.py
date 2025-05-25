from ranger.api.commands import Command
import os

class set_wallpaper(Command):
    def execute(self):
        filepath = self.fm.thisfile.path
        session = os.environ.get("XDG_SESSION_TYPE", "").lower()

        if session == "wayland":
            os.system(f"swww img '{filepath}' --transition-type none &>/dev/null &")
        else:
            os.system(f"nitrogen --set-zoom-fill --save '{filepath}' &>/dev/null &")

        self.fm.notify(f"Wallpaper set: {filepath}")


class set_colortheme(Command):
    def execute(self):
        filepath = self.fm.thisfile.path
        os.system(f"wal -nqi '{filepath}' &>/dev/null &")
        self.fm.notify(f"Colortheme set: {filepath}")
        return

class set_live(Command):
    """
    :set_wallpaper

    Sets the selected file as wallpaper:
    - Images: Uses `nitrogen`
    - Videos: Uses `xwinwrap` (live wallpaper)
    """

    VIDEO_EXTS = ('.mp4', '.webm', '.mkv', '.mov', '.avi', '.gif')

    def execute(self):
        file = self.fm.thisfile.path
        ext = os.path.splitext(file)[1].lower()

        if ext in self.VIDEO_EXTS:
            os.system("pkill xwinwrap && sleep 0.8")
            os.system(f"xwinwrap -ni -fs -ov -un -- mpv -wid WID --loop --no-audio '{file}' &> /dev/null &")
            self.fm.notify(f"Setting live wallpaper: {file}")
        else:
            os.system("pkill xwinwrap")
            os.system(f"nitrogen --set-zoom-fill --save '{file}' &> /dev/null &")
            self.fm.notify(f"Setting wallpaper: {file}")
