
import os
import time
import signal
import sys

def signal_handler_term(sig, frame):
    print ('Меня прервали pid=%d, ppid=%d, я выхожу' % (os.getpid(), os.getppid()))      
    sys.exit(7)

def signal_handler_stop(sig, frame):
    print ('Я игнорирйю останов pid=%d, ppid=%d' % (os.getpid(), os.getppid()))      

def main():
    signal.signal(signal.SIGTERM, signal_handler_term)
    signal.signal(signal.SIGTSTP, signal_handler_stop)

    pid = os.fork()
    if pid == 0:
        print("Я child процесс pid=%d, мой родительский процесс ppid=%d" % 
            (os.getpid(), os.getppid()))
        time.sleep(10000)
    else:
        print("Я родитель pid=%d, мой child процесс pid=%d" % 
            (os.getpid(), pid))
        status = os.waitpid(0, 0)
        print("Вышел процесс pid=%d, с кодом=%d" 
            % (status[0], os.WEXITSTATUS(status[1])))

if __name__ == "__main__":
    main()