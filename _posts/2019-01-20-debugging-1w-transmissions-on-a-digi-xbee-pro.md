---
layout: single
title: Debugging 1W transmissions on a Digi XBEE PRO
date: 2019-01-20 18:46 -0500
tags:
  - subt
  - debugging
---

This describes our (me, Akarsh & Michael) little adventure of trying to figure out why the transmission power from a Digi Xbee PRO module was much lower than expected.

![Digi XBee Pro node without the metal can](https://lh3.googleusercontent.com/pN7vNzihwYZlKQFTpClomjOn8tEeqIwYohWmL04NqOvJXnqR1EX6crPogFLYGJVmTlBWGEb1TWXyXowh942qRnFc4ImY7vg2QRgd2nhjxrvMuCPO81A7jZtFwWbPV8okDgNkkoEfw9Jyz-cbheMKB_haxjgReJfSxPqwIOtWJUZCKxVf4a5ldg8A7Nui1fw_fjLh2LQxmeSC5o5KOpivlgRP_xSGddl5A6BJectFb9J_93ekLEtvyvh7HK_am5yMQIJcjei936ZgL3Qh32QrD2ekld1gF18pREDfUR0wsiPWQGrHb869wMB7TV6Di3wk4hRPciEesBSUjM7UbGh7lJXDhShCVWVgb7UgvfLFDW82RBEhLysaSL-WT5ErVIFVaebYFX7_Ti9f2uUrsyjn2D9EYWxck46HcdyFFjB_hCJ2UauB6yqHqKCq4CUOnpERtNqFonoK7IPokIpZGQCjEFcxpIs6Fp_9sT_6_BsPN3ZkE1hWb-AH8Fq3w7xAj4-95zNjnz7V00_Ct8Ro2kUrO36E3tZ4szJFfpJkT5LIRmakhoUoyEbOUm-JuwCdhGV30tODKBy1zDCwQKVOHFhSvIZYUBAx_RLU27hlPCHpMIc2bz1I-6Mf-SSkpdyBAdDi5z3c6hzdtdGymOWc-9KmueB1=w1200-h900)

## XBEE PRO SX module hardware

We could identify these ICs on the Xbee PRO module:

- Silicon Labs EFM32-G230F256G Gecko Cortex-M3 microcontroller
- Analog Devices ADF7023 FSK/ASK transceiver
- Qorvo RF5110 GSM power amplifier