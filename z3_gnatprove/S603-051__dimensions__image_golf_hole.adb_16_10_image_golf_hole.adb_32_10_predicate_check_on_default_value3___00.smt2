;; produced by z3_gnatprove.drv ;;
(set-info :smt-lib-version 2.5)
(set-info :source |VC generated by SPARK 2014|)
(set-info :category industrial)
(set-info :status unknown)
;;; generated by SMT-LIB2 driver
;;; SMT-LIB2 driver: bit-vectors, common part
;;; SMT-LIB2: integer arithmetic
;;; SMT-LIB2: real arithmetic
(define-fun fp.isFinite64 ((x Float64)) Bool (not (or (fp.isInfinite x) (fp.isNaN x))))
(define-fun fp.isIntegral64 ((x Float64)) Bool (or (fp.isZero x) (and (fp.isNormal x) (= x (fp.roundToIntegral RNE x)))))
(declare-sort string 0)

(declare-datatypes () ((tuple0 (Tuple0))))
(declare-sort us_private 0)

(declare-fun private__bool_eq (us_private us_private) Bool)

(declare-const us_null_ext__ us_private)

(declare-sort us_type_of_heap 0)

(declare-datatypes ()
((us_type_of_heap__ref
 (us_type_of_heap__refqtmk (us_type_of_heap__content us_type_of_heap)))))
(declare-sort us_image 0)

(declare-datatypes () ((int__ref (int__refqtmk (int__content Int)))))
(declare-datatypes () ((bool__ref (bool__refqtmk (bool__content Bool)))))
(declare-datatypes ()
((us_fixed__ref (us_fixed__refqtmk (us_fixed__content Int)))))
(declare-datatypes () ((real__ref (real__refqtmk (real__content Real)))))
(declare-datatypes ()
((us_private__ref (us_private__refqtmk (us_private__content us_private)))))
(define-fun int__ref___projection ((a int__ref)) Int (int__content a))

(define-fun us_fixed__ref___projection ((a us_fixed__ref)) Int (us_fixed__content
                                                               a))

(define-fun bool__ref___projection ((a bool__ref)) Bool (bool__content a))

(define-fun real__ref___projection ((a real__ref)) Real (real__content a))

(define-fun us_private__ref___projection ((a us_private__ref)) us_private 
  (us_private__content a))

(declare-fun pow2 (Int) Int)

(define-fun is_plus_infinity ((x Float64)) Bool (and (fp.isInfinite x)
                                                (fp.isPositive x)))

(define-fun is_minus_infinity ((x Float64)) Bool (and (fp.isInfinite x)
                                                 (fp.isNegative x)))

(define-fun is_plus_zero ((x Float64)) Bool (and (fp.isZero x)
                                            (fp.isPositive x)))

(define-fun is_minus_zero ((x Float64)) Bool (and (fp.isZero x)
                                             (fp.isNegative x)))

(declare-fun of_int (RoundingMode Int) Float64)

(declare-const max_int Int)

(define-fun in_int_range ((i Int)) Bool (and (<= (- max_int) i)
                                        (<= i max_int)))

(define-fun in_safe_int_range ((i Int)) Bool (and (<= (- 9007199254740992) i)
                                             (<= i 9007199254740992)))

(define-fun same_sign ((x Float64)
  (y Float64)) Bool (or (and (fp.isPositive x) (fp.isPositive y))
                    (and (fp.isNegative x) (fp.isNegative y))))

(define-fun diff_sign ((x Float64)
  (y Float64)) Bool (or (and (fp.isPositive x) (fp.isNegative y))
                    (and (fp.isNegative x) (fp.isPositive y))))

(define-fun product_sign ((z Float64) (x Float64)
  (y Float64)) Bool (and (=> (same_sign x y) (fp.isPositive z))
                    (=> (diff_sign x y) (fp.isNegative z))))

(define-fun sqr ((x Real)) Real (* x x))

(declare-fun sqrt1 (Real) Real)

(define-fun same_sign_real ((x Float64)
  (r Real)) Bool (or (and (fp.isPositive x) (< 0.0 r))
                 (and (fp.isNegative x) (< r 0.0))))

(declare-datatypes () ((t__ref (t__refqtmk (t__content Float64)))))
(declare-sort bw_pixel 0)

(declare-fun bw_pixelqtint (bw_pixel) Int)

;; bw_pixel'axiom
  (assert
  (forall ((i bw_pixel))
  (and (<= 0 (bw_pixelqtint i)) (<= (bw_pixelqtint i) 255))))

(define-fun in_range ((x Int)) Bool (and (<= 0 x) (<= x 255)))

(declare-fun attr__ATTRIBUTE_IMAGE (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Int)

(declare-fun user_eq (bw_pixel bw_pixel) Bool)

(declare-const dummy bw_pixel)

(declare-datatypes ()
((bw_pixel__ref (bw_pixel__refqtmk (bw_pixel__content bw_pixel)))))
(define-fun bw_pixel__ref_bw_pixel__content__projection ((a bw_pixel__ref)) bw_pixel 
  (bw_pixel__content a))

(define-fun to_rep ((x bw_pixel)) Int (bw_pixelqtint x))

(declare-fun of_rep (Int) bw_pixel)

;; inversion_axiom
  (assert
  (forall ((x bw_pixel))
  (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x bw_pixel)) (! (in_range (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                           (of_rep x))) )))

(declare-sort map1 0)

(declare-datatypes () ((map__ref (map__refqtmk (map__content map1)))))
(declare-fun get (map1 Int Int) bw_pixel)

(declare-fun set (map1 Int Int bw_pixel) map1)

;; Select_eq
  (assert
  (forall ((m map1))
  (forall ((i Int))
  (forall ((j Int))
  (forall ((a bw_pixel))
  (! (= (get (set m i j a) i j) a) :pattern ((set m i j a)) ))))))

;; Select_neq
  (assert
  (forall ((m map1))
  (forall ((i Int) (i2 Int))
  (forall ((j Int) (j2 Int))
  (forall ((a bw_pixel))
  (! (=> (not (and (= i i2) (= j j2)))
     (= (get (set m i j a) i2 j2) (get m i2 j2))) :pattern ((get
                                                            (set m i j a) i2
                                                            j2)) :pattern (
  (set m i j a) (get m i2 j2)) ))))))

(declare-fun slide (map1 Int Int Int Int) map1)

;; slide_def
  (assert
  (forall ((a map1))
  (forall ((new_first Int) (old_first Int))
  (forall ((new_first_2 Int) (old_first_2 Int))
  (forall ((i Int))
  (forall ((j Int))
  (! (= (get (slide a old_first new_first old_first_2 new_first_2) i j) 
  (get a (- i (- new_first old_first)) (- j (- new_first_2 old_first_2)))) :pattern (
  (get (slide a old_first new_first old_first_2 new_first_2) i j)) )))))))

(define-fun bool_eq ((a map1) (a__first Int) (a__last Int) (a__first_2 Int)
  (a__last_2 Int) (b map1) (b__first Int) (b__last Int) (b__first_2 Int)
  (b__last_2 Int)) Bool (ite (and
                             (and
                             (ite (<= a__first a__last)
                             (and (<= b__first b__last)
                             (= (- a__last a__first) (- b__last b__first)))
                             (< b__last b__first))
                             (ite (<= a__first_2 a__last_2)
                             (and (<= b__first_2 b__last_2)
                             (= (- a__last_2 a__first_2) (- b__last_2 b__first_2)))
                             (< b__last_2 b__first_2)))
                             (forall ((temp___idx_154 Int)
                             (temp___idx_155 Int))
                             (=>
                             (and
                             (and (<= a__first temp___idx_154)
                             (<= temp___idx_154 a__last))
                             (and (<= a__first_2 temp___idx_155)
                             (<= temp___idx_155 a__last_2)))
                             (= (to_rep
                                (get a temp___idx_154 temp___idx_155)) 
                             (to_rep
                             (get b (+ (- b__first a__first) temp___idx_154)
                             (+ (- b__first_2 a__first_2) temp___idx_155)))))))
                        true false))

;; bool_eq_rev
  (assert
  (forall ((a map1) (b map1))
  (forall ((a__first Int) (a__last Int) (a__first_2 Int) (a__last_2 Int)
  (b__first Int) (b__last Int) (b__first_2 Int) (b__last_2 Int))
  (=>
  (= (bool_eq b b__first b__last b__first_2 b__last_2 a a__first a__last
     a__first_2 a__last_2) true)
  (and
  (and
  (ite (<= a__first a__last)
  (and (<= b__first b__last) (= (- a__last a__first) (- b__last b__first)))
  (< b__last b__first))
  (ite (<= a__first_2 a__last_2)
  (and (<= b__first_2 b__last_2)
  (= (- a__last_2 a__first_2) (- b__last_2 b__first_2)))
  (< b__last_2 b__first_2)))
  (forall ((temp___idx_154 Int) (temp___idx_155 Int))
  (=>
  (and (and (<= a__first temp___idx_154) (<= temp___idx_154 a__last))
  (and (<= a__first_2 temp___idx_155) (<= temp___idx_155 a__last_2)))
  (= (to_rep (get a temp___idx_154 temp___idx_155)) (to_rep
                                                    (get b
                                                    (+ (- b__first a__first) temp___idx_154)
                                                    (+ (- b__first_2 a__first_2) temp___idx_155)))))))))))

(declare-const image map1)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-sort rows 0)

(declare-fun rowsqtint (rows) Int)

;; rows'axiom
  (assert
  (forall ((i rows)) (and (<= 0 (rowsqtint i)) (<= (rowsqtint i) 199))))

(define-fun in_range1 ((x Int)) Bool (and (<= 0 x) (<= x 199)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq1 (rows rows) Bool)

(declare-const dummy1 rows)

(declare-datatypes () ((rows__ref (rows__refqtmk (rows__content rows)))))
(define-fun rows__ref_rows__content__projection ((a rows__ref)) rows 
  (rows__content a))

(define-fun to_rep1 ((x rows)) Int (rowsqtint x))

(declare-fun of_rep1 (Int) rows)

;; inversion_axiom
  (assert
  (forall ((x rows)) (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; range_axiom
  (assert
  (forall ((x rows)) (! (in_range1 (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range1 x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
                                                              (of_rep1 x))) )))

(declare-sort columns 0)

(declare-fun columnsqtint (columns) Int)

;; columns'axiom
  (assert
  (forall ((i columns))
  (and (<= 0 (columnsqtint i)) (<= (columnsqtint i) 319))))

(define-fun in_range2 ((x Int)) Bool (and (<= 0 x) (<= x 319)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq2 (columns columns) Bool)

(declare-const dummy2 columns)

(declare-datatypes ()
((columns__ref (columns__refqtmk (columns__content columns)))))
(define-fun columns__ref_columns__content__projection ((a columns__ref)) columns 
  (columns__content a))

(define-fun to_rep2 ((x columns)) Int (columnsqtint x))

(declare-fun of_rep2 (Int) columns)

;; inversion_axiom
  (assert
  (forall ((x columns))
  (! (= (of_rep2 (to_rep2 x)) x) :pattern ((to_rep2 x)) )))

;; range_axiom
  (assert
  (forall ((x columns)) (! (in_range2 (to_rep2 x)) :pattern ((to_rep2 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range2 x) (= (to_rep2 (of_rep2 x)) x)) :pattern ((to_rep2
                                                              (of_rep2 x))) )))

(declare-sort signature_type 0)

(declare-fun signature_typeqtint (signature_type) Int)

;; signature_type'axiom
  (assert
  (forall ((i signature_type))
  (and (<= 0 (signature_typeqtint i)) (<= (signature_typeqtint i) 7))))

(define-fun in_range3 ((x Int)) Bool (and (<= 0 x) (<= x 7)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq3 (signature_type signature_type) Bool)

(declare-const dummy3 signature_type)

(declare-datatypes ()
((signature_type__ref
 (signature_type__refqtmk (signature_type__content signature_type)))))
(define-fun signature_type__ref_signature_type__content__projection ((a signature_type__ref)) signature_type 
  (signature_type__content a))

(define-fun to_rep3 ((x signature_type)) Int (signature_typeqtint x))

(declare-fun of_rep3 (Int) signature_type)

;; inversion_axiom
  (assert
  (forall ((x signature_type))
  (! (= (of_rep3 (to_rep3 x)) x) :pattern ((to_rep3 x)) )))

;; range_axiom
  (assert
  (forall ((x signature_type)) (! (in_range3
  (to_rep3 x)) :pattern ((to_rep3 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range3 x) (= (to_rep3 (of_rep3 x)) x)) :pattern ((to_rep3
                                                              (of_rep3 x))) )))

(declare-sort widths 0)

(declare-fun widthsqtint (widths) Int)

;; widths'axiom
  (assert
  (forall ((i widths)) (and (<= 0 (widthsqtint i)) (<= (widthsqtint i) 320))))

(define-fun in_range4 ((x Int)) Bool (and (<= 0 x) (<= x 320)))

(declare-fun attr__ATTRIBUTE_IMAGE4 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) Int)

(declare-fun user_eq4 (widths widths) Bool)

(declare-const dummy4 widths)

(declare-datatypes ()
((widths__ref (widths__refqtmk (widths__content widths)))))
(define-fun widths__ref_widths__content__projection ((a widths__ref)) widths 
  (widths__content a))

(define-fun to_rep4 ((x widths)) Int (widthsqtint x))

(declare-fun of_rep4 (Int) widths)

;; inversion_axiom
  (assert
  (forall ((x widths))
  (! (= (of_rep4 (to_rep4 x)) x) :pattern ((to_rep4 x)) )))

;; range_axiom
  (assert
  (forall ((x widths)) (! (in_range4 (to_rep4 x)) :pattern ((to_rep4 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range4 x) (= (to_rep4 (of_rep4 x)) x)) :pattern ((to_rep4
                                                              (of_rep4 x))) )))

(declare-sort heights 0)

(declare-fun heightsqtint (heights) Int)

;; heights'axiom
  (assert
  (forall ((i heights))
  (and (<= 0 (heightsqtint i)) (<= (heightsqtint i) 200))))

(define-fun in_range5 ((x Int)) Bool (and (<= 0 x) (<= x 200)))

(declare-fun attr__ATTRIBUTE_IMAGE5 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check5 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE5 (us_image) Int)

(declare-fun user_eq5 (heights heights) Bool)

(declare-const dummy5 heights)

(declare-datatypes ()
((heights__ref (heights__refqtmk (heights__content heights)))))
(define-fun heights__ref_heights__content__projection ((a heights__ref)) heights 
  (heights__content a))

(define-fun to_rep5 ((x heights)) Int (heightsqtint x))

(declare-fun of_rep5 (Int) heights)

;; inversion_axiom
  (assert
  (forall ((x heights))
  (! (= (of_rep5 (to_rep5 x)) x) :pattern ((to_rep5 x)) )))

;; range_axiom
  (assert
  (forall ((x heights)) (! (in_range5 (to_rep5 x)) :pattern ((to_rep5 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range5 x) (= (to_rep5 (of_rep5 x)) x)) :pattern ((to_rep5
                                                              (of_rep5 x))) )))

(declare-datatypes ()
((us_split_fields
 (us_split_fieldsqtmk
 (rec__camera_types__blob_type__signature signature_type)(rec__camera_types__blob_type__x columns)(rec__camera_types__blob_type__y rows)(rec__camera_types__blob_type__width widths)(rec__camera_types__blob_type__height heights)))))
(define-fun us_split_fields_rec__camera_types__blob_type__signature__projection ((a us_split_fields)) signature_type 
  (rec__camera_types__blob_type__signature a))

(define-fun us_split_fields_rec__camera_types__blob_type__x__projection ((a us_split_fields)) columns 
  (rec__camera_types__blob_type__x a))

(define-fun us_split_fields_rec__camera_types__blob_type__y__projection ((a us_split_fields)) rows 
  (rec__camera_types__blob_type__y a))

(define-fun us_split_fields_rec__camera_types__blob_type__width__projection ((a us_split_fields)) widths 
  (rec__camera_types__blob_type__width a))

(define-fun us_split_fields_rec__camera_types__blob_type__height__projection ((a us_split_fields)) heights 
  (rec__camera_types__blob_type__height a))

(declare-datatypes ()
((us_split_fields__ref
 (us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ()
((us_rep (us_repqtmk (us_split_fields1 us_split_fields)))))
(define-fun us_rep___split_fields__projection ((a us_rep)) us_split_fields 
  (us_split_fields1 a))

(define-fun bool_eq1 ((a us_rep)
  (b us_rep)) Bool (ite (and
                        (and
                        (= (to_rep3
                           (rec__camera_types__blob_type__signature
                           (us_split_fields1 a))) (to_rep3
                                                  (rec__camera_types__blob_type__signature
                                                  (us_split_fields1 b))))
                        (= (to_rep2
                           (rec__camera_types__blob_type__x
                           (us_split_fields1 a))) (to_rep2
                                                  (rec__camera_types__blob_type__x
                                                  (us_split_fields1 b)))))
                        (and
                        (and
                        (= (to_rep1
                           (rec__camera_types__blob_type__y
                           (us_split_fields1 a))) (to_rep1
                                                  (rec__camera_types__blob_type__y
                                                  (us_split_fields1 b))))
                        (= (to_rep4
                           (rec__camera_types__blob_type__width
                           (us_split_fields1 a))) (to_rep4
                                                  (rec__camera_types__blob_type__width
                                                  (us_split_fields1 b)))))
                        (= (to_rep5
                           (rec__camera_types__blob_type__height
                           (us_split_fields1 a))) (to_rep5
                                                  (rec__camera_types__blob_type__height
                                                  (us_split_fields1 b))))))
                   true false))

(declare-const value__size Int)

(declare-const object__size Int)

(declare-const alignment Int)

;; value__size_axiom
  (assert (<= 0 value__size))

;; object__size_axiom
  (assert (<= 0 object__size))

;; alignment_axiom
  (assert (<= 0 alignment))

(declare-const camera_types__blob_type__signature__first__bit Int)

(declare-const camera_types__blob_type__signature__last__bit Int)

(declare-const camera_types__blob_type__signature__position Int)

;; camera_types__blob_type__signature__first__bit_axiom
  (assert (<= 0 camera_types__blob_type__signature__first__bit))

;; camera_types__blob_type__signature__last__bit_axiom
  (assert
  (< camera_types__blob_type__signature__first__bit camera_types__blob_type__signature__last__bit))

;; camera_types__blob_type__signature__position_axiom
  (assert (<= 0 camera_types__blob_type__signature__position))

(declare-const camera_types__blob_type__x__first__bit Int)

(declare-const camera_types__blob_type__x__last__bit Int)

(declare-const camera_types__blob_type__x__position Int)

;; camera_types__blob_type__x__first__bit_axiom
  (assert (<= 0 camera_types__blob_type__x__first__bit))

;; camera_types__blob_type__x__last__bit_axiom
  (assert
  (< camera_types__blob_type__x__first__bit camera_types__blob_type__x__last__bit))

;; camera_types__blob_type__x__position_axiom
  (assert (<= 0 camera_types__blob_type__x__position))

(declare-const camera_types__blob_type__y__first__bit Int)

(declare-const camera_types__blob_type__y__last__bit Int)

(declare-const camera_types__blob_type__y__position Int)

;; camera_types__blob_type__y__first__bit_axiom
  (assert (<= 0 camera_types__blob_type__y__first__bit))

;; camera_types__blob_type__y__last__bit_axiom
  (assert
  (< camera_types__blob_type__y__first__bit camera_types__blob_type__y__last__bit))

;; camera_types__blob_type__y__position_axiom
  (assert (<= 0 camera_types__blob_type__y__position))

(declare-const camera_types__blob_type__width__first__bit Int)

(declare-const camera_types__blob_type__width__last__bit Int)

(declare-const camera_types__blob_type__width__position Int)

;; camera_types__blob_type__width__first__bit_axiom
  (assert (<= 0 camera_types__blob_type__width__first__bit))

;; camera_types__blob_type__width__last__bit_axiom
  (assert
  (< camera_types__blob_type__width__first__bit camera_types__blob_type__width__last__bit))

;; camera_types__blob_type__width__position_axiom
  (assert (<= 0 camera_types__blob_type__width__position))

(declare-const camera_types__blob_type__height__first__bit Int)

(declare-const camera_types__blob_type__height__last__bit Int)

(declare-const camera_types__blob_type__height__position Int)

;; camera_types__blob_type__height__first__bit_axiom
  (assert (<= 0 camera_types__blob_type__height__first__bit))

;; camera_types__blob_type__height__last__bit_axiom
  (assert
  (< camera_types__blob_type__height__first__bit camera_types__blob_type__height__last__bit))

;; camera_types__blob_type__height__position_axiom
  (assert (<= 0 camera_types__blob_type__height__position))

(declare-fun user_eq6 (us_rep us_rep) Bool)

(declare-const dummy6 us_rep)

(declare-datatypes ()
((blob_type__ref (blob_type__refqtmk (blob_type__content us_rep)))))
(define-fun blob_type__ref_blob_type__content__projection ((a blob_type__ref)) us_rep 
  (blob_type__content a))

(define-fun abs1 ((x Int)) Int (ite (<= 0 x) x (- x)))

;; Abs_le
  (assert
  (forall ((x Int) (y Int)) (= (<= (abs1 x) y) (and (<= (- y) x) (<= x y)))))

;; Abs_pos
  (assert (forall ((x Int)) (<= 0 (abs1 x))))

(declare-fun div1 (Int Int) Int)

(declare-fun mod1 (Int Int) Int)

;; Div_mod
  (assert
  (forall ((x Int) (y Int))
  (=> (not (= y 0)) (= x (+ (* y (div1 x y)) (mod1 x y))))))

;; Div_bound
  (assert
  (forall ((x Int) (y Int))
  (=> (and (<= 0 x) (< 0 y)) (and (<= 0 (div1 x y)) (<= (div1 x y) x)))))

;; Mod_bound
  (assert
  (forall ((x Int) (y Int))
  (=> (not (= y 0))
  (and (< (- (abs1 y)) (mod1 x y)) (< (mod1 x y) (abs1 y))))))

;; Div_sign_pos
  (assert
  (forall ((x Int) (y Int)) (=> (and (<= 0 x) (< 0 y)) (<= 0 (div1 x y)))))

;; Div_sign_neg
  (assert
  (forall ((x Int) (y Int)) (=> (and (<= x 0) (< 0 y)) (<= (div1 x y) 0))))

;; Mod_sign_pos
  (assert
  (forall ((x Int) (y Int))
  (=> (and (<= 0 x) (not (= y 0))) (<= 0 (mod1 x y)))))

;; Mod_sign_neg
  (assert
  (forall ((x Int) (y Int))
  (=> (and (<= x 0) (not (= y 0))) (<= (mod1 x y) 0))))

;; Rounds_toward_zero
  (assert
  (forall ((x Int) (y Int))
  (=> (not (= y 0)) (<= (abs1 (* (div1 x y) y)) (abs1 x)))))

;; Div_1
  (assert (forall ((x Int)) (= (div1 x 1) x)))

;; Mod_1
  (assert (forall ((x Int)) (= (mod1 x 1) 0)))

;; Div_inf
  (assert
  (forall ((x Int) (y Int)) (=> (and (<= 0 x) (< x y)) (= (div1 x y) 0))))

;; Mod_inf
  (assert
  (forall ((x Int) (y Int)) (=> (and (<= 0 x) (< x y)) (= (mod1 x y) x))))

;; Div_mult
  (assert
  (forall ((x Int) (y Int) (z Int))
  (! (=> (and (< 0 x) (and (<= 0 y) (<= 0 z)))
     (= (div1 (+ (* x y) z) x) (+ y (div1 z x)))) :pattern ((div1
                                                            (+ (* x y) z) x)) )))

;; Mod_mult
  (assert
  (forall ((x Int) (y Int) (z Int))
  (! (=> (and (< 0 x) (and (<= 0 y) (<= 0 z)))
     (= (mod1 (+ (* x y) z) x) (mod1 z x))) :pattern ((mod1 (+ (* x y) z) x)) )))

(define-fun mod2 ((x Int)
  (y Int)) Int (ite (< 0 y) (mod x y) (+ (mod x y) y)))

(define-fun dynamic_invariant ((temp___expr_268 us_rep)
  (temp___is_init_264 Bool) (temp___skip_constant_265 Bool)
  (temp___do_toplevel_266 Bool)
  (temp___do_typ_inv_267 Bool)) Bool (=> (= temp___do_toplevel_266 true)
                                     (and (in_range2
                                     (+ (to_rep2
                                        (rec__camera_types__blob_type__x
                                        (us_split_fields1 temp___expr_268))) 
                                     (div1
                                     (to_rep4
                                     (rec__camera_types__blob_type__width
                                     (us_split_fields1 temp___expr_268))) 2)))
                                     (in_range1
                                     (+ (to_rep1
                                        (rec__camera_types__blob_type__y
                                        (us_split_fields1 temp___expr_268))) 
                                     (div1
                                     (to_rep5
                                     (rec__camera_types__blob_type__height
                                     (us_split_fields1 temp___expr_268))) 2))))))

(define-fun default_initial_assumption ((temp___expr_272 us_rep)
  (temp___skip_top_level_273 Bool)) Bool (and
                                         (and
                                         (= (to_rep3
                                            (rec__camera_types__blob_type__signature
                                            (us_split_fields1
                                            temp___expr_272))) 0)
                                         (= (to_rep2
                                            (rec__camera_types__blob_type__x
                                            (us_split_fields1
                                            temp___expr_272))) 0))
                                         (and
                                         (and
                                         (= (to_rep1
                                            (rec__camera_types__blob_type__y
                                            (us_split_fields1
                                            temp___expr_272))) 0)
                                         (= (to_rep4
                                            (rec__camera_types__blob_type__width
                                            (us_split_fields1
                                            temp___expr_272))) 0))
                                         (= (to_rep5
                                            (rec__camera_types__blob_type__height
                                            (us_split_fields1
                                            temp___expr_272))) 0))))

(define-fun dynamic_predicate ((temp___274 us_rep)) Bool (and (in_range2
                                                         (+ (to_rep2
                                                            (rec__camera_types__blob_type__x
                                                            (us_split_fields1
                                                            temp___274))) 
                                                         (div1
                                                         (to_rep4
                                                         (rec__camera_types__blob_type__width
                                                         (us_split_fields1
                                                         temp___274))) 2)))
                                                         (in_range1
                                                         (+ (to_rep1
                                                            (rec__camera_types__blob_type__y
                                                            (us_split_fields1
                                                            temp___274))) 
                                                         (div1
                                                         (to_rep5
                                                         (rec__camera_types__blob_type__height
                                                         (us_split_fields1
                                                         temp___274))) 2)))))

(declare-fun distance_to_object (us_rep) Float64)

(declare-fun distance_to_object__function_guard (Float64 us_rep) Bool)

(declare-sort distance_to_object_range 0)

(define-fun in_range6 ((x Float64)) Bool (and (fp.isFinite64 x)
                                         (and
                                         (fp.leq (fp #b0 #b00000000000 #b0000000000000000000000000000000000000000000000000000) x)
                                         (fp.leq x (fp #b0 #b01111111111 #b0000000000000000000000000000000000000000000000000000)))))

(declare-fun user_eq7 (distance_to_object_range
  distance_to_object_range) Bool)

(declare-fun attr__ATTRIBUTE_IMAGE6 (Float64) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check6 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE6 (us_image) Float64)

(declare-const dummy7 distance_to_object_range)

(declare-datatypes ()
((distance_to_object_range__ref
 (distance_to_object_range__refqtmk
 (distance_to_object_range__content distance_to_object_range)))))
(define-fun distance_to_object_range__ref_distance_to_object_range__content__projection ((a distance_to_object_range__ref)) distance_to_object_range 
  (distance_to_object_range__content a))

(define-fun dynamic_invariant1 ((temp___expr_310 Float64)
  (temp___is_init_306 Bool) (temp___skip_constant_307 Bool)
  (temp___do_toplevel_308 Bool)
  (temp___do_typ_inv_309 Bool)) Bool (=>
                                     (or (= temp___is_init_306 true)
                                     (fp.leq (fp #b0 #b00000000000 #b0000000000000000000000000000000000000000000000000000) (fp #b0 #b01111111111 #b0000000000000000000000000000000000000000000000000000)))
                                     (in_range6 temp___expr_310)))

;; distance_to_object__post_axiom
  (assert
  (forall ((object_blob us_rep))
  (! (=> (dynamic_invariant object_blob true true true true)
     (let ((result (distance_to_object object_blob)))
     (=> (distance_to_object__function_guard result object_blob)
     (dynamic_invariant1 result true false true true)))) :pattern ((distance_to_object
                                                                   object_blob)) )))

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const c1b Int)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-const c2b Int)

(declare-const attr__ATTRIBUTE_ADDRESS4 Int)

(declare-const attr__ATTRIBUTE_ADDRESS5 Int)

(declare-const attr__ATTRIBUTE_ADDRESS6 Int)

(declare-sort tbw_image_320_typeP1 0)

(declare-fun tbw_image_320_typeP1qtint (tbw_image_320_typeP1) Int)

;; tbw_image_320_typeP1'axiom
  (assert
  (forall ((i tbw_image_320_typeP1))
  (and (<= 0 (tbw_image_320_typeP1qtint i))
  (<= (tbw_image_320_typeP1qtint i) 199))))

(define-fun in_range7 ((x Int)) Bool (and (<= 0 x) (<= x 199)))

(declare-fun attr__ATTRIBUTE_IMAGE7 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check7 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE7 (us_image) Int)

(declare-fun user_eq8 (tbw_image_320_typeP1 tbw_image_320_typeP1) Bool)

(declare-const dummy8 tbw_image_320_typeP1)

(declare-datatypes ()
((tbw_image_320_typeP1__ref
 (tbw_image_320_typeP1__refqtmk
 (tbw_image_320_typeP1__content tbw_image_320_typeP1)))))
(define-fun tbw_image_320_typeP1__ref_tbw_image_320_typeP1__content__projection ((a tbw_image_320_typeP1__ref)) tbw_image_320_typeP1 
  (tbw_image_320_typeP1__content a))

(declare-sort tbw_image_320_typeP2 0)

(declare-fun tbw_image_320_typeP2qtint (tbw_image_320_typeP2) Int)

;; tbw_image_320_typeP2'axiom
  (assert
  (forall ((i tbw_image_320_typeP2))
  (and (<= 0 (tbw_image_320_typeP2qtint i))
  (<= (tbw_image_320_typeP2qtint i) 319))))

(define-fun in_range8 ((x Int)) Bool (and (<= 0 x) (<= x 319)))

(declare-fun attr__ATTRIBUTE_IMAGE8 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check8 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE8 (us_image) Int)

(declare-fun user_eq9 (tbw_image_320_typeP2 tbw_image_320_typeP2) Bool)

(declare-const dummy9 tbw_image_320_typeP2)

(declare-datatypes ()
((tbw_image_320_typeP2__ref
 (tbw_image_320_typeP2__refqtmk
 (tbw_image_320_typeP2__content tbw_image_320_typeP2)))))
(define-fun tbw_image_320_typeP2__ref_tbw_image_320_typeP2__content__projection ((a tbw_image_320_typeP2__ref)) tbw_image_320_typeP2 
  (tbw_image_320_typeP2__content a))

(define-fun dynamic_invariant2 ((temp___expr_185 map1)
  (temp___is_init_181 Bool) (temp___skip_constant_182 Bool)
  (temp___do_toplevel_183 Bool)
  (temp___do_typ_inv_184 Bool)) Bool (=> (= temp___is_init_181 true)
                                     (and
                                     (and
                                     (and (and (<= 1 200) (<= 200 800))
                                     (and (<= 1 320) (<= 320 1200)))
                                     (< 0 199)) (< 0 319))))

(define-fun dynamic_predicate1 ((temp___200 map1)) Bool (and
                                                        (and
                                                        (and
                                                        (and (<= 1 200)
                                                        (<= 200 800))
                                                        (and (<= 1 320)
                                                        (<= 320 1200)))
                                                        (< 0 199)) (< 0 319)))

(define-fun dynamic_invariant3 ((temp___expr_219 Int)
  (temp___is_init_215 Bool) (temp___skip_constant_216 Bool)
  (temp___do_toplevel_217 Bool)
  (temp___do_typ_inv_218 Bool)) Bool (=>
                                     (or (= temp___is_init_215 true)
                                     (<= 0 199)) (in_range1 temp___expr_219)))

(declare-sort scan_rows 0)

(declare-fun scan_rowsqtint (scan_rows) Int)

;; scan_rows'axiom
  (assert
  (forall ((i scan_rows))
  (and (<= 70 (scan_rowsqtint i)) (<= (scan_rowsqtint i) 140))))

(define-fun in_range9 ((x Int)) Bool (and (<= 70 x) (<= x 140)))

(declare-fun attr__ATTRIBUTE_IMAGE9 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check9 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE9 (us_image) Int)

(declare-fun user_eq10 (scan_rows scan_rows) Bool)

(declare-const dummy10 scan_rows)

(declare-datatypes ()
((scan_rows__ref (scan_rows__refqtmk (scan_rows__content scan_rows)))))
(define-fun scan_rows__ref_scan_rows__content__projection ((a scan_rows__ref)) scan_rows 
  (scan_rows__content a))

(define-fun dynamic_invariant4 ((temp___expr_226 Int)
  (temp___is_init_222 Bool) (temp___skip_constant_223 Bool)
  (temp___do_toplevel_224 Bool)
  (temp___do_typ_inv_225 Bool)) Bool (=>
                                     (or (= temp___is_init_222 true)
                                     (<= 70 140)) (in_range9
                                     temp___expr_226)))

(define-fun dynamic_invariant5 ((temp___expr_233 Int)
  (temp___is_init_229 Bool) (temp___skip_constant_230 Bool)
  (temp___do_toplevel_231 Bool)
  (temp___do_typ_inv_232 Bool)) Bool (=>
                                     (or (= temp___is_init_229 true)
                                     (<= 0 319)) (in_range2 temp___expr_233)))

(declare-sort short_length 0)

(define-fun in_range10 ((x Float64)) Bool (and (fp.isFinite64 x)
                                          (and
                                          (fp.leq (fp.neg (fp #b0 #b10000000100 #b1001000000000000000000000000000000000000000000000000)) x)
                                          (fp.leq x (fp #b0 #b10000000100 #b1001000000000000000000000000000000000000000000000000)))))

(declare-fun user_eq11 (short_length short_length) Bool)

(declare-fun attr__ATTRIBUTE_IMAGE10 (Float64) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check10 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE10 (us_image) Float64)

(declare-const dummy11 short_length)

(declare-datatypes ()
((short_length__ref
 (short_length__refqtmk (short_length__content short_length)))))
(define-fun short_length__ref_short_length__content__projection ((a short_length__ref)) short_length 
  (short_length__content a))

(define-fun dynamic_invariant6 ((temp___expr_296 Float64)
  (temp___is_init_292 Bool) (temp___skip_constant_293 Bool)
  (temp___do_toplevel_294 Bool)
  (temp___do_typ_inv_295 Bool)) Bool (=>
                                     (or (= temp___is_init_292 true)
                                     (fp.leq (fp.neg (fp #b0 #b10000000100 #b1001000000000000000000000000000000000000000000000000)) (fp #b0 #b10000000100 #b1001000000000000000000000000000000000000000000000000)))
                                     (in_range10 temp___expr_296)))

(define-fun dynamic_invariant7 ((temp___expr_247 Int)
  (temp___is_init_243 Bool) (temp___skip_constant_244 Bool)
  (temp___do_toplevel_245 Bool)
  (temp___do_typ_inv_246 Bool)) Bool (=>
                                     (or (= temp___is_init_243 true)
                                     (<= 0 7)) (in_range3 temp___expr_247)))

(define-fun dynamic_invariant8 ((temp___expr_254 Int)
  (temp___is_init_250 Bool) (temp___skip_constant_251 Bool)
  (temp___do_toplevel_252 Bool)
  (temp___do_typ_inv_253 Bool)) Bool (=>
                                     (or (= temp___is_init_250 true)
                                     (<= 0 320)) (in_range4 temp___expr_254)))

(define-fun dynamic_invariant9 ((temp___expr_261 Int)
  (temp___is_init_257 Bool) (temp___skip_constant_258 Bool)
  (temp___do_toplevel_259 Bool)
  (temp___do_typ_inv_260 Bool)) Bool (=>
                                     (or (= temp___is_init_257 true)
                                     (<= 0 200)) (in_range5 temp___expr_261)))

(define-fun dynamic_invariant10 ((temp___expr_164 Int)
  (temp___is_init_160 Bool) (temp___skip_constant_161 Bool)
  (temp___do_toplevel_162 Bool)
  (temp___do_typ_inv_163 Bool)) Bool (=>
                                     (or (= temp___is_init_160 true)
                                     (<= 0 255)) (in_range temp___expr_164)))

(declare-const blob__split_fields us_split_fields)

(declare-const observed_distance Float64)

;; Assume
  (assert (dynamic_invariant2 image true false true true))

(declare-const best_column Int)

;; H
  (assert (= best_column 0))

;; Assume
  (assert (dynamic_invariant5 best_column true false true true))

(declare-const best_row Int)

;; H
  (assert (= best_row 70))

;; Assume
  (assert (dynamic_invariant4 best_row true false true true))

;; Assume
  (assert (= best_column c1b))

;; Assume
  (assert (dynamic_invariant5 c1b true false true true))

;; Assume
  (assert (= best_row c2b))

;; Assume
  (assert (dynamic_invariant3 c2b true false true true))

(declare-const usf us_split_fields)

(define-fun usf1 () us_rep (us_repqtmk usf))

;; Ensures
  (assert (default_initial_assumption usf1 false))

(assert
;; defqtvc
 ;; File "image_golf_hole.ads", line 5, characters 0-0
  (not (dynamic_predicate usf1)))
(check-sat)