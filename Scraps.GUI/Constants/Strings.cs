﻿#region License
// Scraps - Scrap.TF Raffle Bot
// Copyright(C) 2022 Caprine Logic
// 
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
// 
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
// GNU General Public License for more details.
// 
// You should have received a copy of the GNU General Public License
// along with this program. If not, see <https://www.gnu.org/licenses/>.
#endregion

namespace Scraps.GUI.Constants;

public static class Strings
{
    public const string UserAgent     = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36";
    public const string AccountBanned = "You have received a site-ban";
    public const string ProfileSetUp  = "Scrap.TF requires your Steam profile and inventory set to <b>Public</b> visibility.";
    public const string SiteDown      = "<div class=\"dialog-title\">We're down!</div>";
    public const string Cloudflare    = "cf-wrapper"; // Not air-tight but should work for now
}