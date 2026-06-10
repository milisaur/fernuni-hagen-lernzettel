#!/usr/bin/env bash

set -euo pipefail

quarto render notes/deskriptiv.qmd --to html
quarto render notes/deskriptiv.qmd --to pdf

quarto render notes/NHST.qmd --to html
quarto render notes/NHST.qmd --to pdf
