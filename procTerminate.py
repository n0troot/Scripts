import ctypes
import time
from colored import fg
red = fg('red')
green = fg('green')
white = fg('white')

k_handle = ctypes.WinDLL("kernel32.dll")
u_handle = ctypes.WinDLL("user32.dll")

PROCESS_ALL_ACCESS = ( 0x000F0000 | 0x00100000 | 0xFFF )

# Get the window's name.
lpWindowNAme = ctypes.c_char_p(input("Process Title => ").encode("UTF-8"))
hWnd = u_handle.FindWindowA(None, lpWindowNAme)
time.sleep(0.5) # Half a second of sleep, for practicality one should remove all instances of this sleep between calls.
if hWnd == 0:
	print(red + "[-]" + white + " Could Not Grab Handle! Error Code: {0}".format(k_handle.GetLastError()))
	exit(1)
else:
	print(green + "[+]" + white + " GOT THE HANDLE!.")

# Take the window's name and derive a process ID from it.
lpdwProcessId = ctypes.c_ulong()
getPid = u_handle.GetWindowThreadProcessId(hWnd, ctypes.byref(lpdwProcessId))
time.sleep(0.5)
if getPid == 0:
	print(red + "[-]" + white + " Could Not Grab PID! Error Code: {0}".format(k_handle.GetLastError()))
	exit(1)
else:
	print(green + "[+]" + white + " GOT PROC'S PID!.")

dwDesiredAccess = PROCESS_ALL_ACCESS
bInheritHandle = False
dwProcessId = lpdwProcessId
# Opens a handle to the process.
hProcess = k_handle.OpenProcess(dwDesiredAccess, bInheritHandle, dwProcessId)
time.sleep(0.5)
if hProcess == 0:
	print(red + "[-]" + white + " Could Not Open Process! Error Code: {0}".format(k_handle.GetLastError()))
else:
	print(green + "[+]" + white + " Process Opened!.")

# Terminate the process
terminateProc = k_handle.TerminateProcess(hProcess, 0)

if terminateProc == 0:
	print(red + "[-]" + white + " Could not terminate process! Error Code: {0}".format(k_handle.GetLastError()))
else:
	print(green + "[+]" + white + " Process went BYE BYE!!")
