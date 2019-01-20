---
layout: post
title: GNU Radio from a Docker container
date: 2018-11-26 17:18 -0500
---

General takeaway: everything, including the GUI works but we cannot pass USB devices to the containers. That may be a problem for Pluto's case.

However, we may be able to get away with just the network (IP) interface.