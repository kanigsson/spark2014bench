(set-info :smt-lib-version 2.6)
(set-logic AUFBVFPDTNIRA)
(set-info :source |
Generated by: AdaCore
Generated on: 2020-03-06
Generator: SPARK
Application: Program verification for Ada
Target solver: CVC4
|)
(set-info :license "https://creativecommons.org/licenses/by/4.0/")
(set-info :category "industrial")
(set-info :status unknown)
;;; generated by SMT-LIB2 driver
;;; SMT-LIB2 driver: bit-vectors, common part
;;; SMT-LIB2: integer arithmetic
;;; SMT-LIB2: real arithmetic
(define-fun fp.isFinite32 ((x Float32)) Bool (not (or (fp.isInfinite x) (fp.isNaN x))))
(define-fun fp.isIntegral32 ((x Float32)) Bool (or (fp.isZero x) (and (fp.isNormal x) (= x (fp.roundToIntegral RNE x)))))
(declare-sort string 0)

(declare-datatypes ((tuple0 0))
(((Tuple0))))
(declare-sort us_private 0)

(declare-fun private__bool_eq (us_private us_private) Bool)

(declare-const us_null_ext__ us_private)

(declare-sort us_type_of_heap 0)

(declare-datatypes ((us_type_of_heap__ref 0))
(((us_type_of_heap__refqtmk (us_type_of_heap__content us_type_of_heap)))))
(declare-sort us_image 0)

(declare-datatypes ((int__ref 0))
(((int__refqtmk (int__content Int)))))
(declare-datatypes ((bool__ref 0))
(((bool__refqtmk (bool__content Bool)))))
(declare-datatypes ((us_fixed__ref 0))
(((us_fixed__refqtmk (us_fixed__content Int)))))
(declare-datatypes ((real__ref 0))
(((real__refqtmk (real__content Real)))))
(declare-datatypes ((us_private__ref 0))
(((us_private__refqtmk (us_private__content us_private)))))
(define-fun int__ref___projection ((a int__ref)) Int (int__content a))

(define-fun us_fixed__ref___projection ((a us_fixed__ref)) Int (us_fixed__content
                                                               a))

(define-fun bool__ref___projection ((a bool__ref)) Bool (bool__content a))

(define-fun real__ref___projection ((a real__ref)) Real (real__content a))

(define-fun us_private__ref___projection ((a us_private__ref)) us_private 
  (us_private__content a))

(declare-fun pow2 (Int) Int)

(define-fun is_plus_infinity ((x Float32)) Bool (and (fp.isInfinite x)
                                                (fp.isPositive x)))

(define-fun is_minus_infinity ((x Float32)) Bool (and (fp.isInfinite x)
                                                 (fp.isNegative x)))

(define-fun is_plus_zero ((x Float32)) Bool (and (fp.isZero x)
                                            (fp.isPositive x)))

(define-fun is_minus_zero ((x Float32)) Bool (and (fp.isZero x)
                                             (fp.isNegative x)))

(declare-const max_int Int)

(define-fun in_int_range ((i Int)) Bool (and (<= (- max_int) i)
                                        (<= i max_int)))

(define-fun in_safe_int_range ((i Int)) Bool (and (<= (- 16777216) i)
                                             (<= i 16777216)))

(define-fun same_sign ((x Float32)
  (y Float32)) Bool (or (and (fp.isPositive x) (fp.isPositive y))
                    (and (fp.isNegative x) (fp.isNegative y))))

(define-fun diff_sign ((x Float32)
  (y Float32)) Bool (or (and (fp.isPositive x) (fp.isNegative y))
                    (and (fp.isNegative x) (fp.isPositive y))))

(define-fun product_sign ((z Float32) (x Float32)
  (y Float32)) Bool (and (=> (same_sign x y) (fp.isPositive z))
                    (=> (diff_sign x y) (fp.isNegative z))))

(define-fun sqr ((x Real)) Real (* x x))

(declare-fun sqrt1 (Real) Real)

(define-fun same_sign_real ((x Float32)
  (r Real)) Bool (or (and (fp.isPositive x) (< 0.0 r))
                 (and (fp.isNegative x) (< r 0.0))))

(declare-datatypes ((t__ref 0))
(((t__refqtmk (t__content Float32)))))
(declare-const r Float32)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const conv_deg_to_rad Float32)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-fun sin1 (Float32) Float32)

(declare-fun sin__function_guard (Float32 Float32) Bool)

(declare-fun cos1 (Float32) Float32)

(declare-fun cos__function_guard (Float32 Float32) Bool)

(declare-sort float_with_approx 0)

(declare-fun user_eq (float_with_approx float_with_approx) Bool)

(declare-fun attr__ATTRIBUTE_IMAGE (Float32) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Float32)

(declare-const dummy float_with_approx)

(declare-datatypes ((float_with_approx__ref 0))
(((float_with_approx__refqtmk (float_with_approx__content float_with_approx)))))
(define-fun float_with_approx__ref_float_with_approx__content__projection ((a float_with_approx__ref)) float_with_approx 
  (float_with_approx__content a))

(define-fun dynamic_invariant ((temp___expr_166 Float32)
  (temp___is_init_162 Bool) (temp___skip_constant_163 Bool)
  (temp___do_toplevel_164 Bool)
  (temp___do_typ_inv_165 Bool)) Bool (=>
                                     (or (= temp___is_init_162 true)
                                     (fp.leq (fp.neg (fp #b0 #b11111110 #b11111111111111111111111)) (fp #b0 #b11111110 #b11111111111111111111111)))
                                     (fp.isFinite32 temp___expr_166)))

;; cos__post_axiom
  (assert
  (forall ((x Float32))
  (! (=> (dynamic_invariant x true true true true)
     (let ((result (cos1 x)))
     (=> (cos__function_guard result x)
     (and
     (=>
     (and (fp.leq (fp.neg (fp #b0 #b10000101 #b00101100000000000000000)) x)
     (fp.leq x (fp #b0 #b10000101 #b00101100000000000000000)))
     (fp.leq (fp #b0 #b01111011 #b10011001100110011001101) result))
     (dynamic_invariant result true false true true))))) :pattern ((cos1 x)) )))

;; cos__def_axiom
  (assert
  (forall ((x Float32))
  (! (=> (dynamic_invariant x true true true true) (= (cos1 x) (sin1 x))) :pattern (
  (cos1 x)) )))

(declare-fun sqrt2 (Float32) Float32)

(declare-fun sqrt__function_guard (Float32 Float32) Bool)

(declare-fun sqrt3 (Float32) Float32)

(declare-fun sqrt__function_guard1 (Float32 Float32) Bool)

;; sqrt__post_axiom
  (assert
  (forall ((x Float32))
  (! (=> (dynamic_invariant x true true true true)
     (let ((result (sqrt2 x)))
     (=> (sqrt__function_guard result x) (dynamic_invariant result true false
     true true)))) :pattern ((sqrt2 x)) )))

;; sqrt__def_axiom
  (assert
  (forall ((x Float32))
  (! (=> (dynamic_invariant x true true true true) (= (sqrt2 x) (sqrt3 x))) :pattern (
  (sqrt2 x)) )))

(declare-sort latitude 0)

(define-fun in_range ((x Float32)) Bool (and (fp.isFinite32 x)
                                        (and
                                        (fp.leq (fp.neg (fp #b0 #b10000101 #b00101100000000000000000)) x)
                                        (fp.leq x (fp #b0 #b10000101 #b00101100000000000000000)))))

(declare-fun user_eq1 (latitude latitude) Bool)

(declare-fun attr__ATTRIBUTE_IMAGE1 (Float32) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Float32)

(declare-const dummy1 latitude)

(declare-datatypes ((latitude__ref 0))
(((latitude__refqtmk (latitude__content latitude)))))
(define-fun latitude__ref_latitude__content__projection ((a latitude__ref)) latitude 
  (latitude__content a))

(declare-fun to_rep (latitude) Float32)

(declare-fun of_rep (Float32) latitude)

;; inversion_axiom
  (assert
  (forall ((x latitude))
  (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x latitude)) (! (in_range (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Float32))
  (! (=> (in_range x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                           (of_rep x))) )))

(declare-sort longitude 0)

(define-fun in_range1 ((x Float32)) Bool (and (fp.isFinite32 x)
                                         (and
                                         (fp.leq (fp.neg (fp #b0 #b10000110 #b01100111111111111111111)) x)
                                         (fp.leq x (fp #b0 #b10000110 #b01101000000000000000000)))))

(declare-fun user_eq2 (longitude longitude) Bool)

(declare-fun attr__ATTRIBUTE_IMAGE2 (Float32) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Float32)

(declare-const dummy2 longitude)

(declare-datatypes ((longitude__ref 0))
(((longitude__refqtmk (longitude__content longitude)))))
(define-fun longitude__ref_longitude__content__projection ((a longitude__ref)) longitude 
  (longitude__content a))

(declare-fun to_rep1 (longitude) Float32)

(declare-fun of_rep1 (Float32) longitude)

;; inversion_axiom
  (assert
  (forall ((x longitude))
  (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; range_axiom
  (assert
  (forall ((x longitude)) (! (in_range1
  (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Float32))
  (! (=> (in_range1 x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
                                                              (of_rep1 x))) )))

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk
  (rec__lat_long__coordinates__lat latitude)(rec__lat_long__coordinates__long longitude)))))
(define-fun us_split_fields_rec__lat_long__coordinates__lat__projection ((a us_split_fields)) latitude 
  (rec__lat_long__coordinates__lat a))

(define-fun us_split_fields_rec__lat_long__coordinates__long__projection ((a us_split_fields)) longitude 
  (rec__lat_long__coordinates__long a))

(declare-datatypes ((us_split_fields__ref 0))
(((us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ((us_rep 0))
(((us_repqtmk (us_split_fields1 us_split_fields)))))
(define-fun us_rep___split_fields__projection ((a us_rep)) us_split_fields 
  (us_split_fields1 a))

(define-fun bool_eq ((a us_rep)
  (b us_rep)) Bool (ite (and
                        (fp.eq (to_rep
                               (rec__lat_long__coordinates__lat
                               (us_split_fields1 a))) (to_rep
                                                      (rec__lat_long__coordinates__lat
                                                      (us_split_fields1 b))))
                        (fp.eq (to_rep1
                               (rec__lat_long__coordinates__long
                               (us_split_fields1 a))) (to_rep1
                                                      (rec__lat_long__coordinates__long
                                                      (us_split_fields1 b)))))
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

(declare-const lat_long__coordinates__lat__first__bit Int)

(declare-const lat_long__coordinates__lat__last__bit Int)

(declare-const lat_long__coordinates__lat__position Int)

;; lat_long__coordinates__lat__first__bit_axiom
  (assert (<= 0 lat_long__coordinates__lat__first__bit))

;; lat_long__coordinates__lat__last__bit_axiom
  (assert
  (< lat_long__coordinates__lat__first__bit lat_long__coordinates__lat__last__bit))

;; lat_long__coordinates__lat__position_axiom
  (assert (<= 0 lat_long__coordinates__lat__position))

(declare-const lat_long__coordinates__long__first__bit Int)

(declare-const lat_long__coordinates__long__last__bit Int)

(declare-const lat_long__coordinates__long__position Int)

;; lat_long__coordinates__long__first__bit_axiom
  (assert (<= 0 lat_long__coordinates__long__first__bit))

;; lat_long__coordinates__long__last__bit_axiom
  (assert
  (< lat_long__coordinates__long__first__bit lat_long__coordinates__long__last__bit))

;; lat_long__coordinates__long__position_axiom
  (assert (<= 0 lat_long__coordinates__long__position))

(declare-fun user_eq3 (us_rep us_rep) Bool)

(declare-const dummy3 us_rep)

(declare-datatypes ((coordinates__ref 0))
(((coordinates__refqtmk (coordinates__content us_rep)))))
(define-fun coordinates__ref_coordinates__content__projection ((a coordinates__ref)) us_rep 
  (coordinates__content a))

(declare-const source us_rep)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const destination us_rep)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-fun delta_lat_in_meters (us_rep us_rep) Float32)

(declare-fun delta_lat_in_meters__function_guard (Float32 us_rep
  us_rep) Bool)

(declare-fun olt (Float32 Float32) Bool)

(declare-fun olt__function_guard (Bool Float32 Float32) Bool)

;; delta_lat_in_meters__post_axiom
  (assert
  (forall ((source1 us_rep) (destination1 us_rep))
  (! (let ((result (delta_lat_in_meters source1 destination1)))
     (and
     (forall ((result1 Float32)) (olt__function_guard
     (olt (fp.abs result1) (fp #b0 #b10010111 #b00110001001111000100110))
     (fp.abs result1) (fp #b0 #b10010111 #b00110001001111000100110)))
     (=> (delta_lat_in_meters__function_guard result source1 destination1)
     (and
     (= (olt (fp.abs result) (fp #b0 #b10010111 #b00110001001111000100110)) true)
     (dynamic_invariant result true false true true))))) :pattern ((delta_lat_in_meters
                                                                   source1
                                                                   destination1)) )))

;; delta_lat_in_meters__def_axiom
  (assert
  (forall ((source1 us_rep) (destination1 us_rep))
  (! (= (delta_lat_in_meters source1 destination1) (fp.mul RNE (fp.mul RNE (fp.sub RNE 
  (to_rep (rec__lat_long__coordinates__lat (us_split_fields1 destination1))) 
  (to_rep (rec__lat_long__coordinates__lat (us_split_fields1 source1)))) 
  r) conv_deg_to_rad)) :pattern ((delta_lat_in_meters source1 destination1)) )))

(declare-fun delta_long_in_meters (us_rep us_rep) Float32)

(declare-fun delta_long_in_meters__function_guard (Float32 us_rep
  us_rep) Bool)

;; delta_long_in_meters__post_axiom
  (assert
  (forall ((source1 us_rep) (destination1 us_rep))
  (! (let ((result (delta_long_in_meters source1 destination1)))
     (and
     (forall ((result1 Float32)) (olt__function_guard
     (olt (fp.abs result1) (fp #b0 #b10011000 #b00110001001111000100110))
     (fp.abs result1) (fp #b0 #b10011000 #b00110001001111000100110)))
     (=> (delta_long_in_meters__function_guard result source1 destination1)
     (and
     (= (olt (fp.abs result) (fp #b0 #b10011000 #b00110001001111000100110)) true)
     (dynamic_invariant result true false true true))))) :pattern ((delta_long_in_meters
                                                                   source1
                                                                   destination1)) )))

;; delta_long_in_meters__def_axiom
  (assert
  (forall ((source1 us_rep) (destination1 us_rep))
  (! (and
     (forall ((source2 us_rep)) (cos__function_guard
     (cos1
     (to_rep (rec__lat_long__coordinates__lat (us_split_fields1 source2))))
     (to_rep (rec__lat_long__coordinates__lat (us_split_fields1 source2)))))
     (= (delta_long_in_meters source1 destination1) (fp.div RNE (fp.mul RNE (fp.sub RNE 
     (to_rep1
     (rec__lat_long__coordinates__long (us_split_fields1 destination1))) 
     (to_rep1 (rec__lat_long__coordinates__long (us_split_fields1 source1)))) 
     r) (cos1
        (to_rep (rec__lat_long__coordinates__lat (us_split_fields1 source1))))))) :pattern (
  (delta_long_in_meters source1 destination1)) )))

(declare-const attr__ATTRIBUTE_ADDRESS4 Int)

(declare-const attr__ATTRIBUTE_ADDRESS5 Int)

(declare-sort tfloat_with_approxB 0)

(declare-fun user_eq4 (tfloat_with_approxB tfloat_with_approxB) Bool)

(declare-fun attr__ATTRIBUTE_IMAGE3 (Float32) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Float32)

(declare-const dummy4 tfloat_with_approxB)

(declare-datatypes ((tfloat_with_approxB__ref 0))
(((tfloat_with_approxB__refqtmk
  (tfloat_with_approxB__content tfloat_with_approxB)))))
(define-fun tfloat_with_approxB__ref_tfloat_with_approxB__content__projection ((a tfloat_with_approxB__ref)) tfloat_with_approxB 
  (tfloat_with_approxB__content a))

(declare-sort float__ 0)

(declare-fun user_eq5 (float__ float__) Bool)

(declare-fun attr__ATTRIBUTE_IMAGE4 (Float32) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) Float32)

(declare-const dummy5 float__)

(declare-datatypes ((float____ref 0))
(((float____refqtmk (float____content float__)))))
(define-fun float____ref_float____content__projection ((a float____ref)) float__ 
  (float____content a))

(define-fun dynamic_invariant1 ((temp___expr_60 Float32)
  (temp___is_init_56 Bool) (temp___skip_constant_57 Bool)
  (temp___do_toplevel_58 Bool)
  (temp___do_typ_inv_59 Bool)) Bool (=>
                                    (or (= temp___is_init_56 true)
                                    (fp.leq (fp.neg (fp #b0 #b11111110 #b11111111111111111111111)) (fp #b0 #b11111110 #b11111111111111111111111)))
                                    (fp.isFinite32 temp___expr_60)))

;; olt__post_axiom
  (assert true)

;; olt__def_axiom
  (assert
  (forall ((left Float32) (right Float32))
  (! (= (= (olt left right) true)
     (fp.lt left (fp.add RNE right (fp #b0 #b01101110 #b01001111100010110101100)))) :pattern (
  (olt left right)) )))

;; r__def_axiom
  (assert (= r (fp #b0 #b10010101 #b10000100101000110101001)))

;; conv_deg_to_rad__def_axiom
  (assert (= conv_deg_to_rad (fp #b0 #b01111001 #b00011101111101000110101)))

(define-fun dynamic_invariant2 ((temp___expr_180 Float32)
  (temp___is_init_176 Bool) (temp___skip_constant_177 Bool)
  (temp___do_toplevel_178 Bool)
  (temp___do_typ_inv_179 Bool)) Bool (=>
                                     (or (= temp___is_init_176 true)
                                     (fp.leq (fp.neg (fp #b0 #b10000101 #b00101100000000000000000)) (fp #b0 #b10000101 #b00101100000000000000000)))
                                     (in_range temp___expr_180)))

(define-fun dynamic_invariant3 ((temp___expr_187 Float32)
  (temp___is_init_183 Bool) (temp___skip_constant_184 Bool)
  (temp___do_toplevel_185 Bool)
  (temp___do_typ_inv_186 Bool)) Bool (=>
                                     (or (= temp___is_init_183 true)
                                     (fp.leq (fp.neg (fp #b0 #b10000110 #b01100111111111111111111)) (fp #b0 #b10000110 #b01101000000000000000000)))
                                     (in_range1 temp___expr_187)))

;; sqrt__post_axiom
  (assert
  (forall ((x Float32))
  (! (=>
     (and (dynamic_invariant1 x true true true true)
     (fp.leq (fp #b0 #b00000000 #b00000000000000000000000) x))
     (let ((result (sqrt3 x)))
     (and
     (and
     (and
     (and (fp.leq (fp #b0 #b00000000 #b00000000000000000000000) result)
     (=> (fp.eq x (fp #b0 #b00000000 #b00000000000000000000000))
     (fp.eq result (fp #b0 #b00000000 #b00000000000000000000000))))
     (=> (fp.eq x (fp #b0 #b01111111 #b00000000000000000000000))
     (fp.eq result (fp #b0 #b01111111 #b00000000000000000000000))))
     (=> (fp.leq (fp #b0 #b00000000 #b00000000000000000000001) x)
     (fp.lt (fp #b0 #b00000000 #b00000000000000000000000) result)))
     (dynamic_invariant1 result true false true true)))) :pattern ((sqrt3 x)) )))

;; sin__post_axiom
  (assert
  (forall ((x Float32))
  (! (=> (dynamic_invariant1 x true true true true)
     (let ((result (sin1 x)))
     (and
     (and
     (and
     (fp.leq (fp.neg (fp #b0 #b01111111 #b00000000000000000000000)) result)
     (fp.leq result (fp #b0 #b01111111 #b00000000000000000000000)))
     (=> (fp.eq x (fp #b0 #b00000000 #b00000000000000000000000))
     (fp.eq result (fp #b0 #b00000000 #b00000000000000000000000))))
     (dynamic_invariant1 result true false true true)))) :pattern ((sin1 x)) )))

(assert
;; defqtvc
 ;; File "lat_long.ads", line 28, characters 0-0
  (not
  (forall ((delta_lat Float32) (delta_long Float32) (o Float32))
  (=> (dynamic_invariant r true false true true)
  (=> (= (fp #b0 #b10010101 #b10000100101000110101001) r)
  (=> (dynamic_invariant conv_deg_to_rad true false true true)
  (=> (= (fp #b0 #b01111001 #b00011101111101000110101) conv_deg_to_rad)
  (=> (dynamic_invariant delta_lat false false true true)
  (=> (dynamic_invariant delta_long false false true true)
  (=>
  (= (to_rep (rec__lat_long__coordinates__lat (us_split_fields1 source))) o)
  (let ((o1 (cos1 o)))
  (=>
  (and (cos__function_guard o1 o)
  (and (dynamic_invariant o1 true false true true)
  (and (= o1 (sin1 o))
  (=>
  (and (fp.leq (fp.neg (fp #b0 #b10000101 #b00101100000000000000000)) o)
  (fp.leq o (fp #b0 #b10000101 #b00101100000000000000000)))
  (fp.leq (fp #b0 #b01111011 #b10011001100110011001101) o1)))))
  (forall ((o2 Float32))
  (=>
  (= (to_rep1 (rec__lat_long__coordinates__long (us_split_fields1 source))) o2)
  (forall ((o3 Float32))
  (=>
  (= (to_rep1
     (rec__lat_long__coordinates__long (us_split_fields1 destination))) o3)
  (not (fp.isZero o1))))))))))))))))))
(check-sat)
(exit)
