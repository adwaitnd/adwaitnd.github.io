---
layout: single
title: Debugging 1W transmissions on a Digi XBEE PRO
date: 2019-01-20 18:46 -0500
tags:
  - subt
  - debugging
---

This describes our (me, Akarsh & Michael) little adventure of trying to figure out why the transmission power from a Digi Xbee PRO module was much lower than expected.

![Digi XBee Pro node without the metal can](https://lh3.googleusercontent.com/o0MnJWcSalgGihlv8JZxiOYlkMJyIDolxDIZ-c_4c8oZwFZOUeBcexpqYWKnP0qViXt8ecatBfKWG4lhE0rmy-SF1W7RYtnB77tgnupkqBrpuyCHaKm-4eHlqDZK4Omdkx7KYvypgQ=w2400)

## XBEE PRO SX module hardware

We could identify these ICs on the Xbee PRO module:

- Silicon Labs EFM32-G230F256G Gecko Cortex-M3 microcontroller
- Analog Devices ADF7023 FSK/ASK transceiver
- Qorvo RF5110 GSM power amplifier