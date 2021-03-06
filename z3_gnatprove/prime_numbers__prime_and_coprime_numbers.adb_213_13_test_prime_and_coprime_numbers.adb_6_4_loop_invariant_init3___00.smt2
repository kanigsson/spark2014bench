(set-info :smt-lib-version 2.6)
(set-logic AUFBVFPDTNIRA)
(set-info :source |
Generated by: AdaCore
Generated on: 2020-03-06
Generator: SPARK
Application: Program verification for Ada
Target solver: Z3
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

(declare-fun pow2 (Int) Int)

(define-fun is_plus_infinity ((x Float32)) Bool (and (fp.isInfinite x)
                                                (fp.isPositive x)))

(define-fun is_minus_infinity ((x Float32)) Bool (and (fp.isInfinite x)
                                                 (fp.isNegative x)))

(define-fun is_plus_zero ((x Float32)) Bool (and (fp.isZero x)
                                            (fp.isPositive x)))

(define-fun is_minus_zero ((x Float32)) Bool (and (fp.isZero x)
                                             (fp.isNegative x)))

(declare-fun of_int (RoundingMode Int) Float32)

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

(declare-datatypes () ((t__ref (t__refqtmk (t__content Float32)))))
(define-fun in_range ((x Int)) Bool (or (= x 0) (= x 1)))

(declare-fun attr__ATTRIBUTE_IMAGE (Bool) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Bool)

(declare-sort integer 0)

(declare-fun integerqtint (integer) Int)

;; integer'axiom
  (assert
  (forall ((i integer))
  (and (<= (- 2147483648) (integerqtint i)) (<= (integerqtint i) 2147483647))))

(define-fun in_range1 ((x Int)) Bool (and (<= (- 2147483648) x)
                                     (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq (integer integer) Bool)

(declare-const dummy integer)

(declare-datatypes ()
((integer__ref (integer__refqtmk (integer__content integer)))))
(define-fun integer__ref_integer__content__projection ((a integer__ref)) integer 
  (integer__content a))

(define-fun dynamic_invariant ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647))
                                    (in_range1 temp___expr_18)))

(declare-datatypes ()
((map__ref (map__refqtmk (map__content (Array Int Bool))))))
(declare-fun slide ((Array Int Bool) Int Int) (Array Int Bool))

;; slide_eq
  (assert
  (forall ((a (Array Int Bool)))
  (forall ((first Int))
  (! (= (slide a first first) a) :pattern ((slide a first first)) ))))

;; slide_def
  (assert
  (forall ((a (Array Int Bool)))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i Int))
  (! (= (select (slide a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
  (slide a old_first new_first) i)) ))))))

(define-fun bool_eq ((a (Array Int Bool)) (a__first Int) (a__last Int)
  (b (Array Int Bool)) (b__first Int)
  (b__last Int)) Bool (ite (and
                           (ite (<= a__first a__last)
                           (and (<= b__first b__last)
                           (= (- a__last a__first) (- b__last b__first)))
                           (< b__last b__first))
                           (forall ((temp___idx_154 Int))
                           (=>
                           (and (<= a__first temp___idx_154)
                           (<= temp___idx_154 a__last))
                           (= (ite (select a temp___idx_154) 1 0) (ite (select b (+ (- b__first a__first) temp___idx_154)) 1 0)))))
                      true false))

;; bool_eq_rev
  (assert
  (forall ((a (Array Int Bool)) (b (Array Int Bool)))
  (forall ((a__first Int) (a__last Int) (b__first Int) (b__last Int))
  (=> (= (bool_eq b b__first b__last a a__first a__last) true)
  (and
  (ite (<= a__first a__last)
  (and (<= b__first b__last) (= (- a__last a__first) (- b__last b__first)))
  (< b__last b__first))
  (forall ((temp___idx_154 Int))
  (=> (and (<= a__first temp___idx_154) (<= temp___idx_154 a__last))
  (= (ite (select a temp___idx_154) 1 0) (ite (select b (+ (- b__first a__first) temp___idx_154)) 1 0)))))))))

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-fun is_prime (Int) Bool)

(declare-fun is_prime__function_guard (Bool Int) Bool)

(declare-sort value_type 0)

(declare-fun value_typeqtint (value_type) Int)

;; value_type'axiom
  (assert
  (forall ((i value_type))
  (and (<= 0 (value_typeqtint i)) (<= (value_typeqtint i) 2147483647))))

(define-fun in_range2 ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq1 (value_type value_type) Bool)

(declare-const dummy1 value_type)

(declare-datatypes ()
((value_type__ref (value_type__refqtmk (value_type__content value_type)))))
(define-fun value_type__ref_value_type__content__projection ((a value_type__ref)) value_type 
  (value_type__content a))

(define-fun dynamic_invariant1 ((temp___expr_200 Int)
  (temp___is_init_196 Bool) (temp___skip_constant_197 Bool)
  (temp___do_toplevel_198 Bool)
  (temp___do_typ_inv_199 Bool)) Bool (=>
                                     (or (= temp___is_init_196 true)
                                     (<= 0 2147483647)) (in_range2
                                     temp___expr_200)))

;; is_prime__post_axiom
  (assert true)

;; is_prime__def_axiom
  (assert
  (forall ((value Int))
  (! (= (= (is_prime value) true)
     (and (<= 2 value)
     (forall ((v Int))
     (=> (and (<= 2 v) (<= v (- value 1))) (not (= (mod2 value v) 0)))))) :pattern (
  (is_prime value)) )))

(declare-fun valid_prime_data ((Array Int Bool)) Bool)

(declare-fun valid_prime_data__function_guard (Bool (Array Int Bool)) Bool)

;; valid_prime_data__post_axiom
  (assert true)

;; valid_prime_data__def_axiom
  (assert
  (forall
  ((test_prime_and_coprime_numbers__p__set__is_prime (Array Int Bool)))
  (! (and (forall ((v Int)) (is_prime__function_guard (is_prime v) v))
     (=
     (= (valid_prime_data test_prime_and_coprime_numbers__p__set__is_prime) true)
     (forall ((v Int))
     (=> (and (<= 0 v) (<= v 100000))
     (= (= (select test_prime_and_coprime_numbers__p__set__is_prime v) true)
     (= (is_prime v) true)))))) :pattern ((valid_prime_data
                                          test_prime_and_coprime_numbers__p__set__is_prime)) )))

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-sort float__ 0)

(declare-fun user_eq2 (float__ float__) Bool)

(declare-fun attr__ATTRIBUTE_IMAGE3 (Float32) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Float32)

(declare-const dummy2 float__)

(declare-datatypes ()
((float____ref (float____refqtmk (float____content float__)))))
(define-fun float____ref_float____content__projection ((a float____ref)) float__ 
  (float____content a))

(define-fun dynamic_invariant2 ((temp___expr_60 Float32)
  (temp___is_init_56 Bool) (temp___skip_constant_57 Bool)
  (temp___do_toplevel_58 Bool)
  (temp___do_typ_inv_59 Bool)) Bool (=>
                                    (or (= temp___is_init_56 true)
                                    (fp.leq (fp.neg (fp #b0 #b11111110 #b11111111111111111111111)) (fp #b0 #b11111110 #b11111111111111111111111)))
                                    (fp.isFinite32 temp___expr_60)))

(declare-fun sqrt2 (Float32) Float32)

(declare-fun sqrt__function_guard (Float32 Float32) Bool)

;; sqrt__post_axiom
  (assert
  (forall ((x Float32))
  (! (=>
     (and (dynamic_invariant2 x true true true true)
     (fp.leq (fp #b0 #b00000000 #b00000000000000000000000) x))
     (let ((result (sqrt2 x)))
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
     (dynamic_invariant2 result true false true true)))) :pattern ((sqrt2 x)) )))

(declare-const r82b Int)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-const attr__ATTRIBUTE_ADDRESS4 Int)

(declare-sort tnumber_list_typeD1 0)

(declare-fun tnumber_list_typeD1qtint (tnumber_list_typeD1) Int)

;; tnumber_list_typeD1'axiom
  (assert
  (forall ((i tnumber_list_typeD1))
  (and (<= 0 (tnumber_list_typeD1qtint i))
  (<= (tnumber_list_typeD1qtint i) 100000))))

(define-fun in_range3 ((x Int)) Bool (and (<= 0 x) (<= x 100000)))

(declare-fun attr__ATTRIBUTE_IMAGE4 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) Int)

(declare-fun user_eq3 (tnumber_list_typeD1 tnumber_list_typeD1) Bool)

(declare-const dummy3 tnumber_list_typeD1)

(declare-datatypes ()
((tnumber_list_typeD1__ref
 (tnumber_list_typeD1__refqtmk
 (tnumber_list_typeD1__content tnumber_list_typeD1)))))
(define-fun tnumber_list_typeD1__ref_tnumber_list_typeD1__content__projection ((a tnumber_list_typeD1__ref)) tnumber_list_typeD1 
  (tnumber_list_typeD1__content a))

(define-fun to_rep ((x integer)) Int (integerqtint x))

(declare-fun of_rep (Int) integer)

;; inversion_axiom
  (assert
  (forall ((x integer)) (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x integer)) (! (in_range1 (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range1 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                            (of_rep x))) )))

(define-fun dynamic_property ((first_int Int) (last_int Int)
  (x Int)) Bool (and (<= first_int x) (<= x last_int)))

(declare-fun attr__ATTRIBUTE_IMAGE5 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check5 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE5 (us_image) Int)

(declare-fun user_eq4 (integer integer) Bool)

(declare-const dummy4 integer)

(declare-datatypes () ((t83b__ref (t83b__refqtmk (t83b__content integer)))))
(define-fun t83b__ref_t83b__content__projection ((a t83b__ref)) integer 
  (t83b__content a))

(declare-fun temp_____aggregate_def_331 (Bool) (Array Int Bool))

;; def_axiom
  (assert
  (forall ((temp___333 Bool))
  (forall ((temp___334 Int))
  (= (select (temp_____aggregate_def_331 temp___333) temp___334) temp___333))))

;; r82b__def_axiom
  (assert
  (= r82b (ite (= ((_ extract 128 128) ((_ fp.to_sbv 129) RNA (sqrt2
                                                              (fp #b0 #b10001111 #b10000110101000000000000)))) #b0) (bv2int ((_ fp.to_sbv 129) RNA 
  (sqrt2 (fp #b0 #b10001111 #b10000110101000000000000)))) (- (bv2int ((_ fp.to_sbv 129) RNA 
  (sqrt2 (fp #b0 #b10001111 #b10000110101000000000000)))) (bv2int (bvshl (_ bv1 130) (_ bv129 130)))))))

(declare-const is_prime1 (Array Int Bool))

(declare-const index_1 Int)

(declare-const index_3 Int)

;; Assume
  (assert true)

;; Assume
  (assert true)

;; Assume
  (assert (dynamic_invariant1 index_1 false false true true))

;; Assume
  (assert true)

;; Assume
  (assert (dynamic_invariant index_3 false false true true))

(declare-const is_prime2 (Array Int Bool))

;; H
  (assert (= is_prime2 (temp_____aggregate_def_331 (distinct 1 0))))

(declare-const is_prime3 (Array Int Bool))

;; H
  (assert (= is_prime3 (store is_prime2 0 (distinct 0 0))))

(declare-const is_prime4 (Array Int Bool))

;; H
  (assert (= is_prime4 (store is_prime3 1 (distinct 0 0))))

(define-fun o () Float32 (sqrt2
                         (fp #b0 #b10001111 #b10000110101000000000000)))

;; H
  (assert (dynamic_invariant2 o true false true true))

;; H
  (assert (fp.leq (fp #b0 #b00000000 #b00000000000000000000000) o))

;; H
  (assert
  (=>
  (fp.eq (fp #b0 #b10001111 #b10000110101000000000000) (fp #b0 #b00000000 #b00000000000000000000000))
  (fp.eq o (fp #b0 #b00000000 #b00000000000000000000000))))

;; H
  (assert
  (=>
  (fp.eq (fp #b0 #b10001111 #b10000110101000000000000) (fp #b0 #b01111111 #b00000000000000000000000))
  (fp.eq o (fp #b0 #b01111111 #b00000000000000000000000))))

;; H
  (assert
  (=>
  (fp.leq (fp #b0 #b00000000 #b00000000000000000000001) (fp #b0 #b10001111 #b10000110101000000000000))
  (fp.lt (fp #b0 #b00000000 #b00000000000000000000000) o)))

(define-fun o1 () Int (ite (= ((_ extract 128 128) ((_ fp.to_sbv 129) RNA 
  o)) #b0) (bv2int ((_ fp.to_sbv 129) RNA o)) (- (bv2int ((_ fp.to_sbv 129) RNA 
  o)) (bv2int (bvshl (_ bv1 130) (_ bv129 130))))))

;; Ensures
  (assert (in_range2 o1))

;; Assume
  (assert (= o1 r82b))

;; Assume
  (assert (dynamic_invariant1 r82b true false true true))

(define-fun temp___336 () Int r82b)

(declare-const index_2 Int)

;; H
  (assert (= index_2 2))

;; H
  (assert
  (= (and (ite (<= 2 index_2) true false) (ite (<= index_2 temp___336) true
                                          false)) true))

;; LoopInvariant
  (assert (and (<= 2 index_2) (<= index_2 100000)))

(declare-const v Int)

;; H
  (assert (<= 0 v))

;; H
  (assert (<= v index_2))

;; H
  (assert (= (select is_prime4 v) true))

;; H
  (assert (forall ((v1 Int)) (is_prime__function_guard (is_prime v1) v1)))

(assert
;; defqtvc
 ;; File "prime_and_coprime_numbers.adb", line 196, characters 0-0
  (not (= (is_prime v) true)))
(check-sat)

(exit)
