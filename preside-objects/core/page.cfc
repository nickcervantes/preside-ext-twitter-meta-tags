component {
	property name="meta_tag_image" relationship="many-to-one" relatedTo="asset"                   required=false allowedTypes="image";
	property name="twitter_card_type"        required=false type="string" dbtype="varchar";
	property name="twitter_creator_username" required=false type="string" dbtype="varchar" maxlength=250;
}