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
    VIDEO_EXTS = ('.mp4', '.webm', '.mkv', '.mov', '.avi', '.gif')

    def execute(self):
        file = self.fm.thisfile.path
        ext = os.path.splitext(file)[1].lower()
        session = os.environ.get("XDG_SESSION_TYPE", "").lower()

        if session == "wayland":
            # Kill previous mpvpaper instance
            os.system("pkill mpvpaper &>/dev/null")
            if ext in self.VIDEO_EXTS:
                os.system(f"mpvpaper '*' -o \"no-audio loop\" '{file}' &>/dev/null &")
                self.fm.notify(f"Live wallpaper set: {file}")
            else:
                os.system(f"swww img '{file}' --transition-type none &>/dev/null &")
                self.fm.notify(f"Static wallpaper set: {file}")
        else:
            # X11 fallback
            os.system("pkill xwinwrap &>/dev/null")
            if ext in self.VIDEO_EXTS:
                os.system(f"xwinwrap -ni -fs -ov -un -- mpv -wid WID --loop --no-audio '{file}' &>/dev/null &")
                self.fm.notify(f"Live wallpaper set: {file}")
            else:
                os.system(f"nitrogen --set-zoom-fill --save '{file}' &>/dev/null &")
                self.fm.notify(f"Static wallpaper set: {file}")
