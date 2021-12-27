#!/usr/bin/env python3

import datetime
import logging
import os
import pathlib
import shutil


def make_backup_path(file_path):
    timestamp = datetime.datetime.now().strftime("%Y%m%d-%H%M%S")
    return file_path.parent / (file_path.name + "-bak-" + timestamp)


def make_backup(file_path):
    backup_path = make_backup_path(file_path)
    shutil.move(file_path, backup_path)
    return backup_path


def link_file(file_name):
    dotfile = pathlib.Path(file_name).resolve()
    file_path = pathlib.Path.home() / file_name

    if not dotfile.is_file():
        error_msg = f"{str(dotfile)} not found"
        logging.error(error_msg)
        raise Exception(error_msg)

    if file_path.is_symlink() and file_path.resolve() == dotfile:
        logging.warning("%s already symlinked to dotfile", file_name)
        return
    if file_path.is_symlink() and file_path.resolve() != dotfile:
        error_msg = f"{file_name} is already symlinked to {file_path.resolve()}"
        logging.error(error_msg)
        raise Exception(error_msg)
    if file_path.is_file() and not file_path.is_symlink():
        backup_path = make_backup(file_path)
        logging.info("Found %s. Backup created at %s", file_path, backup_path)

    os.symlink(dotfile, file_path)
    logging.info("Successfully symlinked %s to %s", file_path, dotfile)


def link_dotfiles():
    for file_name in [".vimrc", ".gitconfig"]:
        link_file(file_name)


if __name__ == "__main__":
    link_dotfiles()
