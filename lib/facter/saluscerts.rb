# List certs managed by Salus

Facter.add("saluscerts") do
    setcode do
        saluscerts = false
        envcontents = nil
        localcertstore = nil
        envfile = "/opt/salus/bin/.env"

        if File.exists? envfile
            storematch = Regexp.new(/LOCAL_CERT_STORE="(.*)"$/)
            envcontents = File.read(envfile)

            if envcontents and result = storematch.match(envcontents)
                localcertstore = result[1]
            end
        end

        if localcertstore and File.directory? localcertstore
            Dir.chdir(localcertstore)
            certs = Dir.glob(["*.crt", "*.key"])
            saluscerts = certs.join(',')
        end
    end
end