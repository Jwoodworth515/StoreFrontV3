﻿using System.Web.Optimization;

namespace StoreFrontV3.UI.MVC
{
    public class BundleConfig
    {
        // For more information on bundling, visit http://go.microsoft.com/fwlink/?LinkId=301862
        public static void RegisterBundles(BundleCollection bundles)
        {
            bundles.Add(new ScriptBundle("~/bundles/jquery").Include(
                        "~/Scripts/jquery-{version}.js"));

            bundles.Add(new ScriptBundle("~/bundles/jqueryval").Include(
                        "~/Scripts/jquery.validate*"));

            // Use the development version of Modernizr to develop with and learn from. Then, when you're
            // ready for production, use the build tool at http://modernizr.com to pick only the tests you need.
            bundles.Add(new ScriptBundle("~/bundles/modernizr").Include(
                        "~/Scripts/modernizr-*"));

            bundles.Add(new ScriptBundle("~/bundles/bootstrap").Include(
                      "~/Scripts/bootstrap.js",
                      "~/Scripts/respond.js"));

            bundles.Add(new ScriptBundle("~/bundles/template").Include("~/Scripts/jquery-1.11.1.min.js", /*"~/Scripts/bootstrap.min.js"*/ "~/Scripts/jquery.lightbox.js", "~/Scripts/templatemo_custom.js", "~/Scripts/dataTables/jquery.dataTables.min.js"));

            bundles.Add(new StyleBundle(
                "~/Content/css").Include("~/Content/bootstrap.min.css", 
                "~/Content/font-awesome.min.css",
                "~/Content/DataTables/css/jquery.dataTables.min.css",
                "~/Content/PagedList.css",
                "~/Content/templatemo_misc.css",
                "~/Content/templatemo_style.css", 
                "~/Content/custom.css"
                ));
        }
    }
}
