

def main() -> int:

    with open("flag.txt", "w") as flag_file:
        flag_file.write("FLAAAAAG")

    return 0


if __name__ == "__main__":
    raise SystemExit(main())