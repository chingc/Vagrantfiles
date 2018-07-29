module Settings

    HOST_OS = RbConfig::CONFIG["host_os"]

    NAME = "holodeck"
    MEMORY = 4096
    CPUS = 2
    VRAM = 128

    DEVICE = case HOST_OS
    when /darwin/
        {
            audio: "coreaudio"
        }
    when /linux/
        {
            audio: "pulse"
        }
    when /win|w32/
        {
            audio: "dsound"
        }
    else
        raise "#{File.basename(__FILE__)}: Don't know which audio device to use for '#{HOST_OS}'"
    end

    VBOX = [
        ["--name", NAME],
        ["--memory", MEMORY],
        ["--cpus", CPUS],
        ["--vram", VRAM],
        ["--audio", DEVICE[:audio]],
        ["--audiocontroller", "hda"],
        ["--clipboard", "bidirectional"],
        ["--draganddrop", "bidirectional"],
        # ["--macaddress1", "auto"]  # randomize mac address every `vagrant up`
    ]

    # many of the parameters for vmware fusion are undocumented so you'll need to look in the .vmx file and experiment
    # ref: https://thornelabs.net/2013/09/28/customizing-vagrant-vmware-fusion-virtual-machines-with-vmx-parameters.html

    VMWARE = [
        ["displayname", NAME],
        ["memsize", MEMORY],
        ["numvcpus", CPUS],
        ["vhv.enable", "TRUE"],  # required by docker
        ["sound.present", "TRUE"],  # add a sound card to the VM
        ["sound.startconnected", "TRUE"],  # enable the sound card
        ["sound.virtualdev", "hdaudio"]  # sound card device type
    ]

end
