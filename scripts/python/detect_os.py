import platform, sys

system = platform.system()
if system == "Linux":
    distro = platform.freedesktop_os_release().get("NAME", "Linux")
elif system == "FreeBSD":
    distro = "FreeBSD"
else:
    distro = system

print(distro)
