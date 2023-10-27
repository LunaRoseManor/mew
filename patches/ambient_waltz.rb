# Welcome to Sonic Pi
use_bpm 60

duration_sequence = [4, 2, 1, 0.5, 0.25, 0.125]

live_loop :melody do
  use_synth :chiplead
  
  with_fx :flanger, mix: 0.1 do
    my_node = play scale([:c3, :c4].choose, :major_pentatonic).choose, attack: 1, decay: 1
    sleep duration_sequence.choose
  end
end

live_loop :waltz do
  use_synth :chipbass
  chord_chosen = chord(scale([:c2, :c3].choose, :major_pentatonic).choose, [:major, :minor].choose)
  play chord_chosen
  sleep 0.25
  play chord_chosen
  sleep 0.5
  play chord_chosen
  sleep 1
end

live_loop :ambi_drone do
  chosen_rate = [0.5, 0.25, 0.1].choose
  sample :ambi_drone, rate: chosen_rate, decay: 1
  sleep sample_duration(:ambi_drone) * chosen_rate
end