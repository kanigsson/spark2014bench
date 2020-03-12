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

(declare-fun has_true ((Array Int Bool) Int Int) Bool)

(declare-fun has_true__function_guard (Bool (Array Int Bool) Int Int) Bool)

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

(declare-const number_list (Array Int Bool))

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const mode Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const value Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-const attr__ATTRIBUTE_ADDRESS4 Int)

(declare-const attr__ATTRIBUTE_ADDRESS5 Int)

(declare-const attr__ATTRIBUTE_ADDRESS6 Int)

(declare-sort tnumber_list_typeD1 0)

(declare-fun tnumber_list_typeD1qtint (tnumber_list_typeD1) Int)

;; tnumber_list_typeD1'axiom
  (assert
  (forall ((i tnumber_list_typeD1))
  (and (<= 0 (tnumber_list_typeD1qtint i))
  (<= (tnumber_list_typeD1qtint i) 100000))))

(define-fun in_range3 ((x Int)) Bool (and (<= 0 x) (<= x 100000)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq2 (tnumber_list_typeD1 tnumber_list_typeD1) Bool)

(declare-const dummy2 tnumber_list_typeD1)

(declare-datatypes ()
((tnumber_list_typeD1__ref
 (tnumber_list_typeD1__refqtmk
 (tnumber_list_typeD1__content tnumber_list_typeD1)))))
(define-fun tnumber_list_typeD1__ref_tnumber_list_typeD1__content__projection ((a tnumber_list_typeD1__ref)) tnumber_list_typeD1 
  (tnumber_list_typeD1__content a))

(declare-sort nearest_mode 0)

(define-fun in_range4 ((x Int)) Bool (and (<= 0 x) (<= x 2)))

(declare-fun attr__ATTRIBUTE_IMAGE4 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) Int)

(declare-fun user_eq3 (nearest_mode nearest_mode) Bool)

(declare-const dummy3 nearest_mode)

(declare-datatypes ()
((nearest_mode__ref
 (nearest_mode__refqtmk (nearest_mode__content nearest_mode)))))
(define-fun nearest_mode__ref_nearest_mode__content__projection ((a nearest_mode__ref)) nearest_mode 
  (nearest_mode__content a))

(define-fun dynamic_invariant2 ((temp___expr_211 Int)
  (temp___is_init_207 Bool) (temp___skip_constant_208 Bool)
  (temp___do_toplevel_209 Bool)
  (temp___do_typ_inv_210 Bool)) Bool (=>
                                     (or (= temp___is_init_207 true)
                                     (<= 0 2)) (in_range4 temp___expr_211)))

(declare-const right_is_out Bool)

(declare-const left_is_out Bool)

;; Assume
  (assert true)

;; Assume
  (assert (dynamic_invariant2 mode true false true true))

;; Assume
  (assert (dynamic_invariant1 value true false true true))

;; H
  (assert (has_true__function_guard (has_true number_list value 100000)
  number_list value 100000))

;; H
  (assert (has_true__function_guard (has_true number_list 0 value)
  number_list 0 value))

;; H
  (assert (has_true__function_guard (has_true number_list 0 100000)
  number_list 0 100000))

;; Assume
  (assert
  (and (and (<= 0 value) (<= value 100000))
  (ite (= mode 0) (= (has_true number_list value 100000) true)
  (ite (= mode 1) (= (has_true number_list 0 value) true)
  (= (has_true number_list 0 100000) true)))))

(define-fun usf () Bool (and (= (ite (select number_list value) 1 0) (ite (distinct 0 0) 1 0)) (= 
  mode 2)))

(define-fun usf1 () Bool (and (= (ite (select number_list value) 1 0) (ite (distinct 0 0) 1 0)) (= 
  mode 0)))

(define-fun usf2 () Bool (= (ite (select number_list value) 1 0) (ite (distinct 1 0) 1 0)))

(define-fun usf3 () Bool (and (= (ite (select number_list value) 1 0) (ite (distinct 0 0) 1 0)) (= 
  mode 1)))

(declare-const right Int)

;; H
  (assert (= right 0))

;; Assume
  (assert (dynamic_invariant right true false true true))

(declare-const left Int)

;; H
  (assert (= left 0))

;; Assume
  (assert (dynamic_invariant left true false true true))

;; Assert
  (assert (and (<= 0 value) (<= value 100000)))

(declare-const spark__branch Bool)

;; H
  (assert (= spark__branch (select number_list value)))

;; H
  (assert (not (= spark__branch true)))

(declare-const spark__branch1 Bool)

(declare-const right1 Int)

(declare-const right_is_out1 Bool)

;; H
  (assert
  (= spark__branch1 (ite (= mode 0) true (ite (= mode 2) true false))))

(declare-const right2 Int)

;; H
  (assert
  (ite (= spark__branch1 true)
  (let ((o value))
  (and (not (= o 2147483647))
  (and (= right2 (+ o 1))
  (exists ((right_is_out2 Bool))
  (and (= right_is_out2 (ite (< 100000 right2) true false))
  (and (or (= right_is_out2 true) (and (<= 0 right2) (<= right2 100000)))
  (ite (= (ite (= right_is_out2 true) true (select number_list right2)) true)
  (and (= right1 right2) (= right_is_out1 right_is_out2))
  (and (in_range1 (+ value 1))
  (exists ((right3 Int))
  (and
  (and (and (<= (+ value 1) right3) (<= right3 100000))
  (forall ((v Int))
  (=> (and (<= value v) (<= v right3)) (not (= (select number_list v) true)))))
  (and (dynamic_invariant right3 true true true true)
  (and (not (= right3 2147483647))
  (and (= right1 (+ right3 1))
  (and (= right_is_out1 (ite (< 100000 right1) true false))
  (and (or (= right_is_out1 true) (and (<= 0 right1) (<= right1 100000)))
  (= (ite (= right_is_out1 true) true (select number_list right1)) true))))))))))))))))
  (and (= right_is_out1 (distinct 1 0)) (= right1 right))))

(declare-const spark__branch2 Bool)

;; H
  (assert
  (= spark__branch2 (ite (= mode 1) true (ite (= mode 2) true false))))

;; H
  (assert (= spark__branch2 true))

(define-fun o () Int value)

;; Ensures
  (assert (not (= o (- 2147483648))))

(declare-const left1 Int)

;; H
  (assert (= left1 (- o 1)))

(declare-const left_is_out1 Bool)

;; H
  (assert (= left_is_out1 (ite (< left1 0) true false)))

;; H
  (assert (or (= left_is_out1 true) (and (<= 0 left1) (<= left1 100000))))

;; H
  (assert
  (not (= (ite (= left_is_out1 true) true (select number_list left1)) true)))

(declare-const usf4 Int)

;; H
  (assert
  (= (and (ite (<= left1 usf4) true false) (ite (<= usf4 value) true false)) true))

(assert
;; defqtvc
 ;; File "prime_and_coprime_numbers.ads", line 60, characters 0-0
  (not (<= 0 usf4)))
(check-sat)
