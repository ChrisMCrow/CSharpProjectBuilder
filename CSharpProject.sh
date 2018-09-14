#!/usr/bin/env bash

# ask for project name
read -p 'Project name: ' projectName
echo 'Project name is "'$projectName'"'

# if there is no directory named $projectName
if [ -d ${projectName}.Solution ]; then
  echo Directory already exists...
else
  # make solution directory
  mkdir $projectName.Solution
  echo Make a new directory named $projectName.Solution...
fi

# make project directory and test directory
mkdir $projectName.Solution/$projectName $projectName.Solution/$projectName.Tests
echo Make new directories named $projectName and $projectName.Tests \in $projectName.Solution directory...

# make README.md file and git initialization
touch $projectName.Solution/README.md
echo Make $projectName.Solution/README.md file...
git init $projectName.Solution/
echo Initialize git...

# make project csproj file
touch $projectName.Solution/$projectName/$projectName.csproj
echo Make new csproj file at $projectName.Solution/$projectName directory...
echo '<Project Sdk="Microsoft.NET.Sdk.Web">' >> $projectName.Solution/$projectName/$projectName.csproj
echo '  <PropertyGroup>' >> $projectName.Solution/$projectName/$projectName.csproj
dotnetVersion="$(dotnet --version)"
echo '    <TargetFramework>netcoreapp1.1</TargetFramework>' >> $projectName.Solution/$projectName/$projectName.csproj
echo '  </PropertyGroup>' >> $projectName.Solution/$projectName/$projectName.csproj
echo '  <ItemGroup>' >> $projectName.Solution/$projectName/$projectName.csproj
echo '    <PackageReference Include="Microsoft.AspNetCore" Version="1.1.2" />' >> $projectName.Solution/$projectName/$projectName.csproj
echo '    <PackageReference Include="Microsoft.AspNetCore.Http" Version="1.1.2" />' >> $projectName.Solution/$projectName/$projectName.csproj
echo '    <PackageReference Include="Microsoft.AspNetCore.Mvc" Version="1.1.3" />' >> $projectName.Solution/$projectName/$projectName.csproj
echo '    <PackageReference Include="Microsoft.AspNetCore.StaticFiles" Version="1.1.3" />' >> $projectName.Solution/$projectName/$projectName.csproj
echo '  </ItemGroup>' >> $projectName.Solution/$projectName/$projectName.csproj
echo '</Project>' >> $projectName.Solution/$projectName/$projectName.csproj
echo Initialize $projectName.Solution/$projectName/$projectName.csproj file...

# make project startup.cs file
touch $projectName.Solution/$projectName/Startup.cs
echo Make new startup file at $projectName.Solution/$projectName directory...
echo 'using Microsoft.AspNetCore.Builder;' >> $projectName.Solution/$projectName/Startup.cs
echo 'using Microsoft.AspNetCore.Hosting;' >> $projectName.Solution/$projectName/Startup.cs
echo 'using Microsoft.AspNetCore.Http;' >> $projectName.Solution/$projectName/Startup.cs
echo 'using Microsoft.Extensions.Configuration;' >> $projectName.Solution/$projectName/Startup.cs
echo 'using Microsoft.Extensions.DependencyInjection;' >> $projectName.Solution/$projectName/Startup.cs
echo '' >> $projectName.Solution/$projectName/Startup.cs
echo 'namespace '$projectName >> $projectName.Solution/$projectName/Startup.cs
echo '{' >> $projectName.Solution/$projectName/Startup.cs
echo '    public class Startup' >> $projectName.Solution/$projectName/Startup.cs
echo '    {' >> $projectName.Solution/$projectName/Startup.cs
echo '        public Startup(IHostingEnvironment env)' >> $projectName.Solution/$projectName/Startup.cs
echo '        {' >> $projectName.Solution/$projectName/Startup.cs
echo '            var builder = new ConfigurationBuilder()' >> $projectName.Solution/$projectName/Startup.cs
echo '                .SetBasePath(env.ContentRootPath)' >> $projectName.Solution/$projectName/Startup.cs
echo '                .AddEnvironmentVariables();' >> $projectName.Solution/$projectName/Startup.cs
echo '            Configuration = builder.Build();' >> $projectName.Solution/$projectName/Startup.cs
echo '        }' >> $projectName.Solution/$projectName/Startup.cs
echo '' >> $projectName.Solution/$projectName/Startup.cs
echo '        public IConfigurationRoot Configuration { get; }' >> $projectName.Solution/$projectName/Startup.cs
echo '' >> $projectName.Solution/$projectName/Startup.cs
echo '        public void ConfigureServices(IServiceCollection services)' >> $projectName.Solution/$projectName/Startup.cs
echo '        {' >> $projectName.Solution/$projectName/Startup.cs
echo '            services.AddMvc();' >> $projectName.Solution/$projectName/Startup.cs
echo '        }' >> $projectName.Solution/$projectName/Startup.cs
echo '' >> $projectName.Solution/$projectName/Startup.cs
echo '        public void Configure(IApplicationBuilder app)' >> $projectName.Solution/$projectName/Startup.cs
echo '        {' >> $projectName.Solution/$projectName/Startup.cs
echo '            app.UseDeveloperExceptionPage();' >> $projectName.Solution/$projectName/Startup.cs
echo '            app.UseStaticFiles();' >> $projectName.Solution/$projectName/Startup.cs
echo '            app.UseMvc(routes =>' >> $projectName.Solution/$projectName/Startup.cs
echo '            {' >> $projectName.Solution/$projectName/Startup.cs
echo '                routes.MapRoute(' >> $projectName.Solution/$projectName/Startup.cs
echo '                    name: "default",' >> $projectName.Solution/$projectName/Startup.cs
echo '                    template: "{controller=Home}/{action=Index}/{id?}");' >> $projectName.Solution/$projectName/Startup.cs
echo '            });' >> $projectName.Solution/$projectName/Startup.cs
echo '            app.Run(async (context) =>' >> $projectName.Solution/$projectName/Startup.cs
echo '            {' >> $projectName.Solution/$projectName/Startup.cs
echo '                await context.Response.WriteAsync("Hello World!");' >> $projectName.Solution/$projectName/Startup.cs
echo '            });' >> $projectName.Solution/$projectName/Startup.cs
echo '        }' >> $projectName.Solution/$projectName/Startup.cs
echo '    }' >> $projectName.Solution/$projectName/Startup.cs
echo '}' >> $projectName.Solution/$projectName/Startup.cs

# implement dotnet restore at project directory
dotnet restore $projectName.Solution/$projectName
echo implement dotnet restore at project directory...

# make project Program.cs file
touch $projectName.Solution/$projectName/Program.cs
echo Make new program file at $projectName.Solution/$projectName directory...
echo 'using System.IO;' >> $projectName.Solution/$projectName/Program.cs
echo 'using Microsoft.AspNetCore.Hosting;' >> $projectName.Solution/$projectName/Program.cs
echo '' >> $projectName.Solution/$projectName/Program.cs
echo 'namespace '$projectName >> $projectName.Solution/$projectName/Program.cs
echo '{' >> $projectName.Solution/$projectName/Program.cs
echo '    public class Program' >> $projectName.Solution/$projectName/Program.cs
echo '    {' >> $projectName.Solution/$projectName/Program.cs
echo '        public static void Main(string[] args)' >> $projectName.Solution/$projectName/Program.cs
echo '        {' >> $projectName.Solution/$projectName/Program.cs
echo '            var host = new WebHostBuilder()' >> $projectName.Solution/$projectName/Program.cs
echo '                .UseKestrel()' >> $projectName.Solution/$projectName/Program.cs
echo '                .UseContentRoot(Directory.GetCurrentDirectory())' >> $projectName.Solution/$projectName/Program.cs
echo '                .UseIISIntegration()' >> $projectName.Solution/$projectName/Program.cs
echo '                .UseStartup<Startup>()' >> $projectName.Solution/$projectName/Program.cs
echo '                .Build();' >> $projectName.Solution/$projectName/Program.cs
echo '' >> $projectName.Solution/$projectName/Program.cs
echo '            host.Run();' >> $projectName.Solution/$projectName/Program.cs
echo '        }' >> $projectName.Solution/$projectName/Program.cs
echo '    }' >> $projectName.Solution/$projectName/Program.cs
echo '}' >> $projectName.Solution/$projectName/Program.cs

# make project test csproj file
touch $projectName.Solution/$projectName.Tests/$projectName.Tests.csproj
echo '<Project Sdk="Microsoft.NET.Sdk">' >> $projectName.Solution/$projectName.Tests/$projectName.Tests.csproj
echo '  <PropertyGroup>' >> $projectName.Solution/$projectName.Tests/$projectName.Tests.csproj
echo '    <TargetFramework>netcoreapp1.1</TargetFramework>' >> $projectName.Solution/$projectName.Tests/$projectName.Tests.csproj
echo '  </PropertyGroup>' >> $projectName.Solution/$projectName.Tests/$projectName.Tests.csproj
echo '  <ItemGroup>' >> $projectName.Solution/$projectName.Tests/$projectName.Tests.csproj
echo '    <PackageReference Include="Microsoft.NET.Test.Sdk" Version="15.8.0" />' >> $projectName.Solution/$projectName.Tests/$projectName.Tests.csproj
echo '    <PackageReference Include="MSTest.TestAdapter" Version="1.3.2" />' >> $projectName.Solution/$projectName.Tests/$projectName.Tests.csproj
echo '    <PackageReference Include="MSTest.TestFramework" Version="1.3.2" />' >> $projectName.Solution/$projectName.Tests/$projectName.Tests.csproj
echo '  </ItemGroup>' >> $projectName.Solution/$projectName.Tests/$projectName.Tests.csproj
echo '  <ItemGroup>' >> $projectName.Solution/$projectName.Tests/$projectName.Tests.csproj
echo '    <ProjectReference Include="..\'$projectName'\'$projectName'.csproj" />' >> $projectName.Solution/$projectName.Tests/$projectName.Tests.csproj
echo '  </ItemGroup>' >> $projectName.Solution/$projectName.Tests/$projectName.Tests.csproj
echo '</Project>' >> $projectName.Solution/$projectName.Tests/$projectName.Tests.csproj
echo Initialize $projectName.Solution/$projectName.Tests/$projectName.Tests.csproj file...

# implement dotnet restore at test directory
dotnet restore $projectName.Solution/$projectName.Tests
echo implement dotnet restore at \test directory...

# make models directory
mkdir $projectName.Solution/$projectName/Models
echo Make $projectName.Solution/$projectName/Models directory...
touch $projectName.Solution/$projectName/Models/ModelTemplate.cs
echo 'using System;' >> $projectName.Solution/$projectName/Models/ModelTemplate.cs
echo 'using System.Collections.Generic;' >> $projectName.Solution/$projectName/Models/ModelTemplate.cs
echo '' >> $projectName.Solution/$projectName/Models/ModelTemplate.cs
echo 'namespace '$projectName'.Models' >> $projectName.Solution/$projectName/Models/ModelTemplate.cs
echo '{' >> $projectName.Solution/$projectName/Models/ModelTemplate.cs
echo '    public class CustomClassHere' >> $projectName.Solution/$projectName/Models/ModelTemplate.cs
echo '    {' >> $projectName.Solution/$projectName/Models/ModelTemplate.cs
echo '' >> $projectName.Solution/$projectName/Models/ModelTemplate.cs
echo '    }' >> $projectName.Solution/$projectName/Models/ModelTemplate.cs
echo '}' >> $projectName.Solution/$projectName/Models/ModelTemplate.cs


# make controllers directory
mkdir $projectName.Solution/$projectName/Controllers
echo Make $projectName.Solution/$projectName/Controllers directory...

# make project home controller file
touch $projectName.Solution/$projectName/Controllers/HomeController.cs
echo 'using System.Collections.Generic;' >> $projectName.Solution/$projectName/Controllers/HomeController.cs
echo 'using Microsoft.AspNetCore.Mvc;' >> $projectName.Solution/$projectName/Controllers/HomeController.cs
echo 'using '$projectName'.Models;' >> $projectName.Solution/$projectName/Controllers/HomeController.cs
echo '' >> $projectName.Solution/$projectName/Controllers/HomeController.cs
echo 'namespace '$projectName'.Controllers' >> $projectName.Solution/$projectName/Controllers/HomeController.cs
echo '{' >> $projectName.Solution/$projectName/Controllers/HomeController.cs
echo '    public class HomeController : Controller' >> $projectName.Solution/$projectName/Controllers/HomeController.cs
echo '    {' >> $projectName.Solution/$projectName/Controllers/HomeController.cs
echo ''
echo '    }' >> $projectName.Solution/$projectName/Controllers/HomeController.cs
echo '}' >> $projectName.Solution/$projectName/Controllers/HomeController.cs

# make views directory with Home & Shared directories
mkdir $projectName.Solution/$projectName/Views
echo Make $projectName.Solution/$projectName/Views directory...
mkdir $projectName.Solution/$projectName/Views/Home
echo Make $projectName.Solution/$projectName/Views/Home directory...
mkdir $projectName.Solution/$projectName/Views/Shared
echo Make $projectName.Solution/$projectName/Views/Shared directory...

# make _Layout.cshtml file
touch $projectName.Solution/$projectName/Views/Shared/_Layout.cshtml
echo '<!DOCTYPE html>' >>$projectName.Solution/$projectName/Views/Shared/_Layout.cshtml
echo '<html>' >>$projectName.Solution/$projectName/Views/Shared/_Layout.cshtml
echo '  <head>' >>$projectName.Solution/$projectName/Views/Shared/_Layout.cshtml
echo '    <meta charset="utf-8">' >>$projectName.Solution/$projectName/Views/Shared/_Layout.cshtml
echo '    <title>'$projectName'</title>' >>$projectName.Solution/$projectName/Views/Shared/_Layout.cshtml
echo '    <link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css'>' >>$projectName.Solution/$projectName/Views/Shared/_Layout.cshtml
echo '    <link rel="stylesheet" href="~/css/styles.css">' >>$projectName.Solution/$projectName/Views/Shared/_Layout.cshtml
echo '    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>' >>$projectName.Solution/$projectName/Views/Shared/_Layout.cshtml
echo '    <script src="~/js/scripts.js"></script>' >>$projectName.Solution/$projectName/Views/Shared/_Layout.cshtml
echo '  </head>' >>$projectName.Solution/$projectName/Views/Shared/_Layout.cshtml
echo '  <body>' >>$projectName.Solution/$projectName/Views/Shared/_Layout.cshtml
echo '    @RenderBody()' >>$projectName.Solution/$projectName/Views/Shared/_Layout.cshtml
echo '  </body>' >>$projectName.Solution/$projectName/Views/Shared/_Layout.cshtml
echo '</html>' >>$projectName.Solution/$projectName/Views/Shared/_Layout.cshtml


# make Index.cshtml file
touch $projectName.Solution/$projectName/Views/Home/Index.cshtml
echo '@{' >>$projectName.Solution/$projectName/Views/Home/Index.cshtml
echo '    Layout = "_Layout"' >>$projectName.Solution/$projectName/Views/Home/Index.cshtml
echo '}' >>$projectName.Solution/$projectName/Views/Home/Index.cshtml
echo '' >>$projectName.Solution/$projectName/Views/Home/Index.cshtml
echo '<div class="container">' >>$projectName.Solution/$projectName/Views/Home/Index.cshtml
echo '' >>$projectName.Solution/$projectName/Views/Home/Index.cshtml
echo '</div>' >>$projectName.Solution/$projectName/Views/Home/Index.cshtml


# make wwwroot directory with img, css, & js directories nested inside
mkdir $projectName.Solution/$projectName/wwwroot
echo Make $projectName.Solution/$projectName/wwwroot directory...
mkdir $projectName.Solution/$projectName/wwwroot/css
echo Make $projectName.Solution/$projectName/wwwroot/css directory...
touch $projectName.Solution/$projectName/wwwroot/css/styles.css
mkdir $projectName.Solution/$projectName/wwwroot/img
echo Make $projectName.Solution/$projectName/wwwroot/img directory...
mkdir $projectName.Solution/$projectName/wwwroot/js
echo Make $projectName.Solution/$projectName/wwwroot/js directory...
touch $projectName.Solution/$projectName/wwwroot/js/scripts.js


# .gitignore
touch $projectName.Solution/$projectName/.gitignore
echo 'obj/' >> $projectName.Solution/$projectName/.gitignore
echo 'bin/' >> $projectName.Solution/$projectName/.gitignore


# make models.test directory
mkdir $projectName.Solution/$projectName.Tests/ModelTests
echo Make $projectName.Solution/$projectName.Tests/ModelTests directory...
