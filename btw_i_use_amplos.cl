(load "svg.cl")

(svg::write "btw_i_use_amplos.svg" 2600 750
            (svg::text "btw, I use" (cons :x 1300) (cons :y 200) (cons :color "white")
                       (cons :font-size "250px") (cons :font "Arial") (cons :text-align "center")
                       (cons :text-anchor "middle"))
            (svg::text "AMPLOS" (cons :x 1300) (cons :y 720) (cons :color "white")
                       (cons :font-size "600px") (cons :font "Arial") (cons :text-align "center")
                       (cons :text-anchor "middle") (cons :font-weight 600)))
