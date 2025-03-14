from ranger.api.commands import Command
import subprocess

class wall_exec(Command):
    """
    :wall_exec

    Asynchronously applies the wallpaper using nitrogen and then runs `wal -i`
    on the selected image, all without exiting Ranger.
    """
    def execute(self):
        image_path = self.fm.thisfile.path  # Get the selected file
        cmd = f"nitrogen --set-zoom-fill --save '{image_path}' && wal -i '{image_path}'"
        subprocess.Popen(
            cmd,
            shell=True,
            stdout=subprocess.DEVNULL,
            stderr=subprocess.DEVNULL
        )

class wall_nitrogen(Command):
    """
    :wall_nitrogen

    Applies the wallpaper using nitrogen.
    """
    def execute(self):
        image_path = self.fm.thisfile.path  # Get the selected file
        cmd = f"nitrogen --set-zoom-fill --save '{image_path}'"
        subprocess.Popen(
            cmd,
            shell=True,
            stdout=subprocess.DEVNULL,
            stderr=subprocess.DEVNULL
        )
