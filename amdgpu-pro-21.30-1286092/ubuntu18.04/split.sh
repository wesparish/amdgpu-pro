#!/bin/bash
tar -czvf - x86_64-linux-gnu.20.40 | split -db 50M - x86_64-linux-gnu.20.40.tar.gz.
