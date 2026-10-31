# Julia Optimization Experiments

A starter repository for developing optimization models and running experiments with Julia, JuMP, HiGHS, and SDDP.jl in VS Code.

## Project structure

```text
julia-optimization/
├── Project.toml             # Project dependencies
├── experiments/             # Runnable experiment scripts
├── src/                     # Reusable models and functions
├── test/                    # Tests
├── data/                    # Example data that can be shared
├── results/                 # Local outputs (excluded from Git)
└── .vscode/                 # Recommended extension
```

## 1. Prerequisites

- [Julia](https://julialang.org/downloads/) 1.10 or later
- [VS Code](https://code.visualstudio.com/) with the **Julia** extension
- [Git](https://git-scm.com/downloads) and a GitHub account

Clone the repository and open it in VS Code:

```bash
git clone https://github.com/homodigitus/julia-optimization.git
cd julia-optimization
code .
```

In the VS Code terminal, run `julia --version` to check that Julia is available. If the command is not found, check your Julia installation and PATH, then restart the terminal.

## 2. Set up the project environment

From the project root, start Julia with this project activated:

```bash
julia --project=.
```

At the `julia>` prompt, install the project's dependencies:

```julia
using Pkg
Pkg.instantiate()
```

The first installation requires an internet connection and may take several minutes. Julia stores downloaded packages in a shared package depot, while `Project.toml` and `Manifest.toml` define the project's environment. Unlike a Python virtual environment, this does not create a separate environment directory inside the project. The manifest records resolved package versions for reproducibility; compatibility can still vary across Julia versions and operating systems.

If you use the VS Code Julia REPL, start it with **Ctrl+Shift+P → Julia: Start REPL** and select the project's `Project.toml` using the Julia environment selector in the status bar. Check the active environment with:

```julia
Base.active_project()
```

The returned path should point to this repository's `Project.toml`.

## 3. Run the example and tests

Exit the Julia REPL with `exit()`, then run these commands from the project root in the terminal:

```bash
julia --project=. experiments/01_uretim_planlama.jl
julia --project=. test/runtests.jl
```

The example maximizes the profit from two products subject to two resource constraints. The expected solution is A = 20, B = 60, and a maximum profit of 2,600.

## 4. Add packages

From the project root, start Julia with `julia --project=.`. Then, at the `julia>` prompt, use Julia's package manager. For example:

```julia
using Pkg
Pkg.add("SDDP")
```

To check the installation:

```julia
using SDDP
```

SDDP is already listed in this project's dependencies, so `Pkg.instantiate()` installs it when setting up the repository. Use `Pkg.add` to add packages that are not already in the project. Adding a package updates `Project.toml` and `Manifest.toml`; commit both when they change.

## 5. Create experiments and push changes

Add runnable `.jl` files to `experiments/` and place reusable functions in `src/`. Recording the objective, constraints, data source, solver and parameters, runtime, and results will make experiments easier to compare.

After exiting Julia, commit and push changes from your terminal:

```bash
git status
git add .
git commit -m "Add optimization experiment"
git push
```

You can create a separate branch for a new experiment, for example:

```bash
git switch -c experiment/vehicle-routing
```

Do not commit passwords, API keys, or confidential customer data. `data/private/` and generated files in `results/` are excluded from Git; other files in `data/` are tracked.
