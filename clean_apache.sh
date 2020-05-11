#!/bin/bash

rm -f /var/log/apache/*
systemctl reload apache
