use_bpm 167

live_loop :metronome do
  with_fx :echo, amp: 1 do
    sample :drum_cymbal_closed
    sleep 1
  end
end

live_loop :measure do
  sleep 4
end

live_loop :hi_hats do
  stop
  sample :drum_cymbal_pedal
  sample :drum_cymbal_closed
  sleep 0.25
end

live_loop :four_to_the_floor do
  stop
  sync :metronome
  with_fx :distortion, mix: 1, distort: 0.9 do
    sample [:drum_bass_hard, :drum_heavy_kick].choose
  end
end

live_loop :drum_sampler do
  stop
  with_fx :distortion, mix: 1, distort: 0.9, amp: 1 do
    pseudonym = [:loop_amen, :loop_amen_full].choose
    r = 1.15
    sample pseudonym, rate: r, decay: 1
    sleep sample_duration(pseudonym) * (1 / r)
  end
end

live_loop :choir do
  sync :measure
  with_fx :reverb, room: 1 do
    with_fx :echo do
      sample :ambi_choir, rate: 0.1, amp: 2, release: 8
      synth :hollow, attack: 8, release: 8, amp: 2, note: scale(:c, :minor_pentatonic).choose
    end
  end
  sleep 4
end

live_loop :riffage do
  stop
  sync :drum_sampler
  with_fx :reverb, mix: 1, amp: 1.2 do
    use_synth :supersaw
    patterns = [
      [:c, :ds, :d, :d, :d, :d, :ds, :f],
      [:c, :ds, :d, :d, :d, :c, :ds, 51]
    ]
    use_transpose 0
    play_pattern_timed patterns.choose, [2.25, 1.5, 1, 1, 1, 0.5, 0.5, 0.55]
  end
end

live_loop :bass do
  sample [:bass_trance_c].choose, amp: 0.2
  sleep 0.5
end

live_loop :plucks do
  stop
  sample :bass_dnb_f, rpitch: 7
  sleep 0.5
end

live_loop :octs do
  stop
  oct = [:c1, :c2]
  use_synth :saw
  use_transpose 0
  play_pattern_timed oct, [0.25, 0.5], amp: 1, attack: 0
end

live_loop :octs2 do
  stop
  oct = [:g6, :c6]
  use_synth :mod_tri
  with_fx :echo do
    play_pattern_timed oct, [0.25, 0.75], amp: 0.1
    sleep 1
  end
end
