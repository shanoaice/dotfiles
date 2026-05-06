function omp-token
    read -s -P "KeePass Password: " keepass_pwd
    
    set ds_token (echo $keepass_pwd | keepassxc-cli show "$KP_DB_PATH" --show-protected --attributes "Password" --quiet "$KP_DEEPSEEK_ATTRIBUTE_NAME")
    set or_token (echo $keepass_pwd | keepassxc-cli show "$KP_DB_PATH" --show-protected --attributes "Password" --quiet "$KP_OPENROUTER_ATTRIBUTE_NAME")

    if test -z "$ds_token"
        echo "Cannot retrieve DeepSeek API key. Aborting."
        exit 1
    end

    if test -z "$or_token"
        echo "Cannot retrieve OpenRouter API key. Aborting."
        exit 1
    end    

    DEEPSEEK_API_KEY=$ds_token OPENROUTER_API_KEY=$or_token omp
end
