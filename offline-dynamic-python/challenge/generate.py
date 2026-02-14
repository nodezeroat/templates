import os

def main() -> int:
    flag = os.getenv("FLAG", "flag{dummy_flag}")

    with open("flag.txt", "w") as flag_file:
        flag_file.write(flag)

    return 0


if __name__ == "__main__":
    raise SystemExit(main())