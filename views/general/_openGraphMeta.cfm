<cfscript>
	local.site         = event.getSite();
	local.teaser       = Trim( event.getPageProperty( "teaser"             ) );
	local.description  = Trim( event.getPageProperty( "description"        ) );
	local.browsertitle = Trim( event.getPageProperty( "browser_title"      ) );
	local.title        = Trim( event.getPageProperty( "title"              ) );
	local.mainImage    = Trim( event.getPageProperty( "main_image"         ) );
	local.ogType       = local.site.og_type ?: "website";

	local.title  = Len( local.browserTitle ) ? local.browserTitle : local.title;
	local.teaser = Len( local.teaser       ) ? local.teaser       : local.description;

	local.metaUrl                = event.getBaseUrl() & HtmlEditFormat( event.getCurrentUrl() );
	local.twitterCardType        = Trim( event.getPageProperty( "twitter_card_type" ) );
	local.twitterCreatorUsername = Trim( event.getPageProperty( "twitter_creator_username" ) );
	local.siteTwitterUsername    = Trim( site.site_twitter_username ?: "" );
	local.metaImage              = Trim( event.getPageProperty( "meta_tag_image" ) );
	local.metaImage              = !isEmpty( local.metaImage ) ? local.metaImage : local.mainImage;
</cfscript>

<cfoutput>
	<meta property="og:title" content="#XmlFormat( local.title )#" />
	<meta property="og:type"  content="#local.ogType#" />
	<meta property="og:url"   content="#local.metaUrl#" />
	<cfif Len( local.teaser )>
		<meta property="og:description" content="#HtmlEditFormat( local.teaser )#" />
	</cfif>
	<cfif Len( local.metaImage )>
		<meta property="og:image" content="#event.buildLink( assetId=local.metaImage )#" />
	</cfif>

	<cfif !isEmptyString( local.twitterCardType ) >
		<meta name="twitter:card" content="#local.twitterCardType#">
	</cfif>
	<meta name="twitter:url"   content="#local.metaUrl#">
	<meta name="twitter:title" content="#XmlFormat( local.title )#">
	<cfif Len( local.teaser )>
		<meta name="twitter:description" content="#HtmlEditFormat( local.teaser )#">
	</cfif>
	<cfif Len( local.metaImage )>
		<meta name="twitter:image" content="#event.buildLink( assetId=local.metaImage )#">
	</cfif>
	<cfif Len( local.twitterCreatorUsername )>
		<meta name="twitter:creator" content="@#local.twitterCreatorUsername#">
	<cfelseif( Len( local.siteTwitterUsername ) ) >
		<meta name="twitter:creator" content="@#local.siteTwitterUsername#">
	</cfif>
	<cfif Len( local.siteTwitterUsername )>
		<meta name="twitter:site" content="@#local.siteTwitterUsername#">
	</cfif>
</cfoutput>