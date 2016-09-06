from PIL import ImageGrab


class ScreenCapture:

    def take_snapshot(self, fileName):
        im = ImageGrab.grab()
        im.save(fileName)
