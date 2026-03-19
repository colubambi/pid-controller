# pid-controller

MATLAB simulation comparing P, PI, and PID controllers on a first-order system. Plots the step response for each controller type and saves the output to `plots/pid_step_response.png`.

## What it does

- Defines a first-order plant: `G(s) = 1 / (s + 1)`
- Builds three controllers: P-only, PI, and PID with tuned gains
- Simulates closed-loop step response for each over 10 seconds
- Plots all three on one figure for direct comparison
- Saves the plot automatically to `plots/`

## Controller gains

| Gain | Value |
|------|-------|
| Kp   | 1.0   |
| Ki   | 1.0   |
| Kd   | 0.1   |

## Key observations from the output

- **P only** — fast initial response but settles with steady-state error (~0.5 instead of 1.0). Expected for P-only control on this plant.
- **PI** — eliminates steady-state error, slightly slower than PID
- **PID** — fastest settling, zero steady-state error, minimal overshoot

## Requirements

- MATLAB with Control System Toolbox

## Usage

```matlab
run('pid_simulation.m')
```

Plot saves to `plots/pid_step_response.png` automatically.
