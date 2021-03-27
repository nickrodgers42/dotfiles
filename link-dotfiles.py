#!/usr/bin/env python3

import datetime
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


def link_vimrc():
    vimrc_dotfile = pathlib.Path(".vimrc").resolve()
    vimrc_path = pathlib.Path.home() / ".vimrc"
    if vimrc_path.is_symlink() and vimrc_path.resolve() == vimrc_dotfile:
        print("~/.vimrc already symlinked to dotfile")
        return
    if vimrc_path.is_symlink() and vimrc_path.resolve() != vimrc_dotfile:
        raise Exception("~/.vimrc is already symlinked to " + virmc_path.resolve())
    if vimrc_path.is_file() and not vimrc_path.is_symlink():
        backup_path = make_backup(vimrc_path)
        print("Found ~/.vimrc file. Backup made at ", backup_path)
    os.symlink(vimrc_dotfile, vimrc_path)
    print("Successfully symlinked ~/.vimrc to dotfile")


def link_dotfiles():
    link_vimrc()


if __name__ == "__main__":
    link_dotfiles()
