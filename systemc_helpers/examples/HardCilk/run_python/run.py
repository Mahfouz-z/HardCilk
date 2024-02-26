import time
import subprocess

apps = ["simulation_paper_exp1", "simulation_paper_exp2", "simulation_paper_exp3"]
delays = [16, 32, 64, 128, 256, 512, 1024]

def main():
    logs = []
    processes = []

    for app in apps:
        for delay in delays:
            log_name = f"output/out_{app}_{delay}.txt"
            log = open(log_name, "w")
            process = subprocess.Popen([f"./{app}", str(delay)], stdout=log.fileno(), stderr=log.fileno(), shell=False)
            logs.append(log)
            processes.append(process)

    time.sleep(5)
    for process in processes:
            

    print("Done!")

    for log in logs:
        log.close()


if __name__ == "__main__":
    main()