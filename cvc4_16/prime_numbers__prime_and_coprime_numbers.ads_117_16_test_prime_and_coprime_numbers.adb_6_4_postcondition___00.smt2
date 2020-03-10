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

(define-fun length ((x Int) (y Int)) Int (ite (<= x y) (+ (- y x) 1) 0))

(define-fun abs1 ((x Int)) Int (ite (<= 0 x) x (- x)))

;; Abs_le
  (assert
  (forall ((x Int) (y Int)) (= (<= (abs1 x) y) (and (<= (- y) x) (<= x y)))))

;; Abs_pos
  (assert (forall ((x Int)) (<= 0 (abs1 x))))

(define-fun min ((x Int) (y Int)) Int (ite (<= x y) x y))

(define-fun max ((x Int) (y Int)) Int (ite (<= x y) y x))

;; Min_r
  (assert (forall ((x Int) (y Int)) (=> (<= y x) (= (min x y) y))))

;; Max_l
  (assert (forall ((x Int) (y Int)) (=> (<= y x) (= (max x y) x))))

;; Min_comm
  (assert (forall ((x Int) (y Int)) (= (min x y) (min y x))))

;; Max_comm
  (assert (forall ((x Int) (y Int)) (= (max x y) (max y x))))

;; Min_assoc
  (assert
  (forall ((x Int) (y Int) (z Int)) (= (min (min x y) z) (min x (min y z)))))

;; Max_assoc
  (assert
  (forall ((x Int) (y Int) (z Int)) (= (max (max x y) z) (max x (max y z)))))

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

(declare-datatypes ((integer__ref 0))
(((integer__refqtmk (integer__content integer)))))
(define-fun integer__ref_integer__content__projection ((a integer__ref)) integer 
  (integer__content a))

(declare-datatypes ((map__ref 0))
(((map__refqtmk (map__content (Array Int Bool))))))
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

;; Div_unique
  (assert
  (forall ((x Int) (y Int) (q Int))
  (=> (< 0 y) (=> (and (<= (* q y) x) (< x (+ (* q y) y))) (= (div x y) q)))))

;; Div_bound
  (assert
  (forall ((x Int) (y Int))
  (=> (and (<= 0 x) (< 0 y)) (and (<= 0 (div x y)) (<= (div x y) x)))))

;; Div_inf
  (assert
  (forall ((x Int) (y Int)) (=> (and (<= 0 x) (< x y)) (= (div x y) 0))))

;; Div_inf_neg
  (assert
  (forall ((x Int) (y Int))
  (=> (and (< 0 x) (<= x y)) (= (div (- x) y) (- 1)))))

;; Mod_0
  (assert (forall ((y Int)) (=> (not (= y 0)) (= (mod 0 y) 0))))

;; Div_1_left
  (assert (forall ((y Int)) (=> (< 1 y) (= (div 1 y) 0))))

;; Div_minus1_left
  (assert (forall ((y Int)) (=> (< 1 y) (= (div (- 1) y) (- 1)))))

;; Mod_1_left
  (assert (forall ((y Int)) (=> (< 1 y) (= (mod 1 y) 1))))

;; Mod_minus1_left
  (assert
  (forall ((y Int))
  (! (=> (< 1 y) (= (mod (- 1) y) (- y 1))) :pattern ((mod (- 1) y)) )))

;; Div_mult
  (assert
  (forall ((x Int) (y Int) (z Int))
  (! (=> (< 0 x) (= (div (+ (* x y) z) x) (+ y (div z x)))) :pattern ((div (+ (* x y) z) x)) )))

;; Mod_mult
  (assert
  (forall ((x Int) (y Int) (z Int))
  (! (=> (< 0 x) (= (mod (+ (* x y) z) x) (mod z x))) :pattern ((mod (+ (* x y) z) x)) )))

(define-fun mod2 ((x Int)
  (y Int)) Int (ite (< 0 y) (mod x y) (+ (mod x y) y)))

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

(declare-datatypes ((value_type__ref 0))
(((value_type__refqtmk (value_type__content value_type)))))
(define-fun value_type__ref_value_type__content__projection ((a value_type__ref)) value_type 
  (value_type__content a))

(define-fun dynamic_invariant ((temp___expr_200 Int)
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

(declare-fun has_prime (Int Int) Bool)

(declare-fun has_prime__function_guard (Bool Int Int) Bool)

;; has_prime__post_axiom
  (assert true)

;; has_prime__def_axiom
  (assert
  (forall ((low Int) (high Int))
  (! (and (forall ((v Int)) (is_prime__function_guard (is_prime v) v))
     (= (= (has_prime low high) true)
     (exists ((v Int))
     (and (and (<= low v) (<= v high)) (= (is_prime v) true))))) :pattern (
  (has_prime low high)) )))

(declare-fun has_true ((Array Int Bool) Int Int) Bool)

(declare-fun has_true__function_guard (Bool (Array Int Bool) Int Int) Bool)

(declare-fun nearest_number ((Array Int Bool) Int Int) Int)

(declare-fun nearest_number__function_guard (Int (Array Int Bool) Int
  Int) Bool)

;; nearest_number__post_axiom
  (assert
  (forall ((number_list (Array Int Bool)))
  (forall ((mode Int) (value Int)) (! (in_range2
  (nearest_number number_list mode value)) :pattern ((nearest_number
                                                     number_list mode value)) ))))

(declare-const value Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const mode Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-sort nearest_mode 0)

(define-fun in_range3 ((x Int)) Bool (and (<= 0 x) (<= x 2)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq2 (nearest_mode nearest_mode) Bool)

(declare-const dummy2 nearest_mode)

(declare-datatypes ((nearest_mode__ref 0))
(((nearest_mode__refqtmk (nearest_mode__content nearest_mode)))))
(define-fun nearest_mode__ref_nearest_mode__content__projection ((a nearest_mode__ref)) nearest_mode 
  (nearest_mode__content a))

(define-fun dynamic_invariant1 ((temp___expr_211 Int)
  (temp___is_init_207 Bool) (temp___skip_constant_208 Bool)
  (temp___do_toplevel_209 Bool)
  (temp___do_typ_inv_210 Bool)) Bool (=>
                                     (or (= temp___is_init_207 true)
                                     (<= 0 2)) (in_range3 temp___expr_211)))

(define-fun dynamic_invariant2 ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647))
                                    (in_range1 temp___expr_18)))

;; has_true__post_axiom
  (assert true)

;; has_true__def_axiom
  (assert
  (forall ((number_list (Array Int Bool)))
  (forall ((low Int) (high Int))
  (! (= (= (has_true number_list low high) true)
     (exists ((v Int))
     (and (and (<= low v) (<= v high)) (= (select number_list v) true)))) :pattern (
  (has_true number_list low high)) ))))

(assert
;; defqtvc
 ;; File "prime_and_coprime_numbers.ads", line 105, characters 0-0
  (not
  (forall ((is_prime1 (Array Int Bool)))
  (=> (dynamic_invariant value true false true true)
  (=> (dynamic_invariant1 mode true false true true)
  (=> (<= 0 value)
  (=> (<= value 100000)
  (=>
  (forall ((is_prime2 (Array Int Bool))) (valid_prime_data__function_guard
  (valid_prime_data is_prime2) is_prime2))
  (=> (= (valid_prime_data is_prime1) true)
  (=> (has_prime__function_guard (has_prime value 100000) value 100000)
  (=> (has_prime__function_guard (has_prime 0 value) 0 value)
  (=> (has_prime__function_guard (has_prime 0 100000) 0 100000)
  (=>
  (ite (= mode 0) (= (has_prime value 100000) true)
  (ite (= mode 1) (= (has_prime 0 value) true) (= (has_prime 0 100000) true)))
  (=> (is_prime__function_guard (is_prime value) value)
  (=> (is_prime__function_guard (is_prime value) value)
  (=> (is_prime__function_guard (is_prime value) value)
  (=> (is_prime__function_guard (is_prime value) value)
  (let ((o value))
  (let ((o1 mode))
  (let ((o2 (nearest_number is_prime1 o1 o)))
  (=>
  (and (nearest_number__function_guard o2 is_prime1 o1 o)
  (and (dynamic_invariant o2 true false true true)
  (and (and (and (<= 0 o2) (<= o2 100000)) (= (select is_prime1 o2) true))
  (ite (= (= (ite (select is_prime1 o) 1 0) (ite (distinct 1 0) 1 0)) true)
  (= o2 o)
  (ite (= (and (= (ite (select is_prime1 o) 1 0) (ite (distinct 0 0) 1 0)) (= o1 0)) true)
  (and (< o o2)
  (forall ((v Int))
  (=> (and (<= o v) (<= v (- o2 1))) (not (= (select is_prime1 v) true)))))
  (ite (= (and (= (ite (select is_prime1 o) 1 0) (ite (distinct 0 0) 1 0)) (= o1 1)) true)
  (and (< o2 o)
  (forall ((v Int))
  (=> (and (<= (+ o2 1) v) (<= v o)) (not (= (select is_prime1 v) true)))))
  (=>
  (= (and (= (ite (select is_prime1 o) 1 0) (ite (distinct 0 0) 1 0)) (= o1 2)) true)
  (and
  (forall ((v Int))
  (=> (and (<= (max 0 (+ (- o (abs1 (- o o2))) 1)) v) (<= v o))
  (not (= (select is_prime1 v) true))))
  (forall ((v Int))
  (=> (and (<= o v) (<= v (min 100000 (- (+ o (abs1 (- o o2))) 1))))
  (not (= (select is_prime1 v) true))))))))))))
  (forall
  ((test_prime_and_coprime_numbers__p__nearest_prime_number__result Int))
  (=> (= test_prime_and_coprime_numbers__p__nearest_prime_number__result o2)
  (=>
  (=> (= (is_prime value) true)
  (= test_prime_and_coprime_numbers__p__nearest_prime_number__result 
  value))
  (=> (forall ((v Int)) (is_prime__function_guard (is_prime v) v))
  (=>
  (=> (= (and (not (is_prime value)) (= mode 0)) true)
  (and
  (< value test_prime_and_coprime_numbers__p__nearest_prime_number__result)
  (forall ((v Int))
  (=>
  (and (<= value v)
  (<= v (- test_prime_and_coprime_numbers__p__nearest_prime_number__result 1)))
  (not (= (is_prime v) true))))))
  (=> (forall ((v Int)) (is_prime__function_guard (is_prime v) v))
  (=>
  (=> (= (and (not (is_prime value)) (= mode 1)) true)
  (and
  (< test_prime_and_coprime_numbers__p__nearest_prime_number__result 
  value)
  (forall ((v Int))
  (=>
  (and
  (<= (+ test_prime_and_coprime_numbers__p__nearest_prime_number__result 1) v)
  (<= v value)) (not (= (is_prime v) true))))))
  (=> (forall ((v Int)) (is_prime__function_guard (is_prime v) v))
  (=> (forall ((v Int)) (is_prime__function_guard (is_prime v) v))
  (=>
  (=> (= (and (not (is_prime value)) (= mode 2)) true)
  (and
  (forall ((v Int))
  (=>
  (and
  (<= (max 0
      (+ (- value (abs1
                  (- value test_prime_and_coprime_numbers__p__nearest_prime_number__result))) 1)) v)
  (<= v value)) (not (= (is_prime v) true))))
  (forall ((v Int))
  (=>
  (and (<= value v)
  (<= v (min 100000
        (- (+ value (abs1
                    (- value test_prime_and_coprime_numbers__p__nearest_prime_number__result))) 1))))
  (not (= (is_prime v) true))))))
  (<= 0 test_prime_and_coprime_numbers__p__nearest_prime_number__result))))))))))))))))))))))))))))))))
(check-sat)
(exit)
