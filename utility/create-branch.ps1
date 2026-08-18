$type = Read-Host "type "

if ($type -notin @("notes", "labs", "bugfix", "feature")) {
    Write-Error "Invalid type. Use: notes, labs, bugfix, or feature"
    exit 1
}

$topic = Read-Host "topic# "

if ([string]::IsNullOrWhiteSpace($topic)) {
    Write-Error "Topic is required."
    exit 1
}

if ($type -eq "notes" -or $type -eq "labs") {
    $subtopic = Read-Host "subtopic# "

    if ([string]::IsNullOrWhiteSpace($subtopic)) {
        Write-Error "Subtopic is required for notes/labs."
        exit 1
    }
}

$branchName = Read-Host "branch name "

if ([string]::IsNullOrWhiteSpace($branchName)) {
    Write-Error "Branch name is required."
    exit 1
}

$date = Get-Date -Format "yyyy-MM-dd"

if ($type -eq "notes" -or $type -eq "labs") {
    $branch = "$type/$topic/$subtopic/$date-$branchName"
}
else {
    $branch = "$type/$topic/$date-$branchName"
}

Write-Host ""
Write-Host "Branch: $branch" -ForegroundColor Cyan

$create = Read-Host "Create branch? [Y/n]"

if ($create -eq "" -or $create -match "^[Yy]$") {
    git branch $branch

    if ($LASTEXITCODE -ne 0) {
        Write-Error "Failed to create branch."
        exit 1
    }

    Write-Host "Branch created successfully." -ForegroundColor Green

    $checkout = Read-Host "Checkout branch? [Y/n]"

    if ($checkout -eq "" -or $checkout -match "^[Yy]$") {
        git switch $branch

        if ($LASTEXITCODE -eq 0) {
            Write-Host "Checked out: $branch" -ForegroundColor Green
        }
        else {
            Write-Error "Failed to checkout branch."
        }
    }
}
else {
    Write-Host "Branch creation cancelled." -ForegroundColor Yellow
}