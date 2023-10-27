# Soundless Express
# Piano Sample: Silent Hill 2 Official Soundtrack by Akira Yamaoka
# Angelic Drone Sample: " "

username = "User"
PATH = "C:\\Users\\#{username}\\Music\\Silent Hill Instrument Bank\\"

live_loop :angelic_drone do
  path_to_sample = (PATH + "SilentHill_DroneAngelic.wav")
  sample_rate = 1
  
  if rand() < 0.1
    sample_rate = sample_rate + rrand(-0.2, 0.2)
  end
  
  with_fx :reverb, mix: 0.4, amp: 1 do
    sign = 1
    2.times do
      sample path_to_sample, rate: sample_rate * sign
      sleep sample_duration(path_to_sample) * sample_rate
      sign = -sign
    end
  end
end

live_loop :train do
  sample_path = [(PATH + "SH Train.wav"), (PATH + "SH Train_2.wav")].choose
  sample_rate = rrand(0.2, 0.4)
  
  with_fx :hpf, cutoff: 0.1, mix: 0.1, amp: 0.3 do
    sample sample_path, rate: sample_rate
    sleep sample_duration(sample_path) * sample_rate
  end
end

live_loop :rain do
  with_fx :hpf, cutoff: 0.5, mix: 0.1, amp: 0.1 do
    synth :bnoise, rpitch: rrand(0.9, 1.1), attack: 1, decay: 1
    sample (PATH + "SilentHill_WaterDroplets.wav"), start: rrand(0, 1), rate: rrand(0.75, 1)
    sleep 1
  end
end

live_loop :whooshing do
  sample_rate = rrand(-1, 1)
  
  with_fx :hpf, cutoff: 0.1, mix: 0.75, amp: 0.75 do
    sample :ambi_dark_woosh, rate: sample_rate
    sleep sample_duration(:ambi_dark_woosh) * [1, 2, 3, 4].choose
  end
end

live_loop :maria do
  maria_lietmotif = [:d6, :e6, :f6, :g6, :f6, :e6, :d6]
  
  sleep [4, 8, 12, 16, 32, 64, 128].choose
  use_synth :piano
  
  if rand() < 0.5
    use_transpose -2
  else
    use_transpose 0
  end
  
  with_fx :reverb, mix: 0.5, room: 1, amp: 0.66 do
    play_pattern maria_lietmotif
  end
end