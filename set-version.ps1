$isTag = $Env:APPVEYOR_REPO_TAG;

$project = 'ConsoleApplication1';
$path = "$project/$project.nuspec";

[xml]$nuspec = Get-Content $path;
if ($isTag) {
  $nuspec.package.metadata.version = '$version$';
} else {
  $nuspec.package.metadata.version = '$version$-beta';
}

$nuspec.Save($path);
