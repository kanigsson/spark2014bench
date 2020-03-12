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

(declare-fun is_too_coarse (Int) Bool)

(declare-fun is_too_coarse__function_guard (Bool Int) Bool)

;; is_too_coarse__post_axiom
  (assert true)

(declare-const from Int)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-datatypes ()
((map__ref (map__refqtmk (map__content (Array Int integer))))))
(declare-fun slide ((Array Int integer) Int Int) (Array Int integer))

;; slide_eq
  (assert
  (forall ((a (Array Int integer)))
  (forall ((first Int))
  (! (= (slide a first first) a) :pattern ((slide a first first)) ))))

;; slide_def
  (assert
  (forall ((a (Array Int integer)))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i Int))
  (! (= (select (slide a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
  (slide a old_first new_first) i)) ))))))

(define-fun bool_eq ((a (Array Int integer)) (a__first Int) (a__last Int)
  (b (Array Int integer)) (b__first Int)
  (b__last Int)) Bool (ite (and
                           (ite (<= a__first a__last)
                           (and (<= b__first b__last)
                           (= (- a__last a__first) (- b__last b__first)))
                           (< b__last b__first))
                           (forall ((temp___idx_154 Int))
                           (=>
                           (and (<= a__first temp___idx_154)
                           (<= temp___idx_154 a__last))
                           (= (to_rep (select a temp___idx_154)) (to_rep
                                                                 (select b (+ (- b__first a__first) temp___idx_154)))))))
                      true false))

;; bool_eq_rev
  (assert
  (forall ((a (Array Int integer)) (b (Array Int integer)))
  (forall ((a__first Int) (a__last Int) (b__first Int) (b__last Int))
  (=> (= (bool_eq b b__first b__last a a__first a__last) true)
  (and
  (ite (<= a__first a__last)
  (and (<= b__first b__last) (= (- a__last a__first) (- b__last b__first)))
  (< b__last b__first))
  (forall ((temp___idx_154 Int))
  (=> (and (<= a__first temp___idx_154) (<= temp___idx_154 a__last))
  (= (to_rep (select a temp___idx_154)) (to_rep
                                        (select b (+ (- b__first a__first) temp___idx_154)))))))))))

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-const attr__ATTRIBUTE_ADDRESS4 Int)

(declare-const attr__ATTRIBUTE_ADDRESS5 Int)

(declare-const c3b Int)

(declare-const attr__ATTRIBUTE_ADDRESS6 Int)

(declare-const attr__ATTRIBUTE_ADDRESS7 Int)

(declare-const c6b Int)

(declare-const attr__ATTRIBUTE_ADDRESS8 Int)

(declare-const attr__ATTRIBUTE_ADDRESS9 Int)

(declare-const c9b Int)

(declare-const attr__ATTRIBUTE_ADDRESS10 Int)

(declare-const c10b Int)

(declare-const attr__ATTRIBUTE_ADDRESS11 Int)

(declare-const attr__ATTRIBUTE_ADDRESS12 Int)

(declare-const c13b Int)

(declare-const attr__ATTRIBUTE_ADDRESS13 Int)

(declare-const c14b Int)

(declare-const attr__ATTRIBUTE_ADDRESS14 Int)

(declare-const attr__ATTRIBUTE_ADDRESS15 Int)

;; c3b__def_axiom
  (assert (= c3b from))

;; c6b__def_axiom
  (assert (= c6b from))

;; c9b__def_axiom
  (assert (= c9b from))

(declare-const memory (Array Int integer))

(declare-const size Int)

(declare-const data1 Int)

(declare-const data2 Int)

(declare-const addr Int)

;; Assume
  (assert true)

;; Assume
  (assert (dynamic_invariant size false false true true))

;; Assume
  (assert (dynamic_invariant data1 false false true true))

;; Assume
  (assert (dynamic_invariant data2 false false true true))

;; Assume
  (assert (dynamic_invariant addr false false true true))

;; Assume
  (assert (dynamic_invariant from true false true true))

;; Assume
  (assert (= from c3b))

;; Assume
  (assert (dynamic_invariant c3b true false true true))

(declare-const o Int)

;; Ensures
  (assert (= (to_rep (select memory c3b)) o))

(define-fun o1 () Int (+ o 0))

;; Ensures
  (assert (in_range1 o1))

(declare-const o2 Int)

;; Ensures
  (assert (= (to_rep (select memory o1)) o2))

(declare-const value Int)

;; H
  (assert (= value o2))

;; Assume
  (assert (dynamic_invariant value true false true true))

(declare-const spark__branch Bool)

(declare-const value1 Int)

;; H
  (assert (is_too_coarse__function_guard (is_too_coarse value) value))

;; H
  (assert (= spark__branch (is_too_coarse value)))

;; H
  (assert
  (ite (= spark__branch true) (dynamic_invariant value1 true true true true)
  (= value1 value)))

(declare-const size1 Int)

;; H
  (assert (= size1 value1))

;; Assume
  (assert
  (and (and (<= 1 size1) (<= size1 10))
  (< (to_rep (select memory from)) (- 2147483647 (* 2 size1)))))

;; Assume
  (assert (= from c6b))

;; Assume
  (assert (dynamic_invariant c6b true false true true))

(declare-const o3 Int)

;; Ensures
  (assert (= (to_rep (select memory c6b)) o3))

(define-fun o4 () Int (+ o3 1))

;; Ensures
  (assert (in_range1 o4))

(declare-const o5 Int)

;; Ensures
  (assert (= (to_rep (select memory o4)) o5))

(declare-const value2 Int)

;; H
  (assert (= value2 o5))

;; Assume
  (assert (dynamic_invariant value2 true false true true))

(declare-const spark__branch1 Bool)

(declare-const value3 Int)

;; H
  (assert (is_too_coarse__function_guard (is_too_coarse value2) value2))

;; H
  (assert (= spark__branch1 (is_too_coarse value2)))

;; H
  (assert
  (ite (= spark__branch1 true) (dynamic_invariant value3 true true true true)
  (= value3 value2)))

;; Assume
  (assert (= from c9b))

;; Assume
  (assert (dynamic_invariant c9b true false true true))

(define-fun o6 () Int (+ size1 1))

;; Ensures
  (assert (in_range1 o6))

;; Assume
  (assert (= o6 c10b))

;; Assume
  (assert (dynamic_invariant c10b true false true true))

(declare-const o7 Int)

;; Ensures
  (assert (= (to_rep (select memory c9b)) o7))

(define-fun o8 () Int (+ o7 c10b))

;; Ensures
  (assert (in_range1 o8))

(declare-const o9 Int)

;; Ensures
  (assert (= (to_rep (select memory o8)) o9))

(declare-const value4 Int)

;; H
  (assert (= value4 o9))

;; Assume
  (assert (dynamic_invariant value4 true false true true))

(declare-const spark__branch2 Bool)

(declare-const value5 Int)

;; H
  (assert (is_too_coarse__function_guard (is_too_coarse value4) value4))

;; H
  (assert (= spark__branch2 (is_too_coarse value4)))

;; H
  (assert
  (ite (= spark__branch2 true) (dynamic_invariant value5 true true true true)
  (= value5 value4)))

(declare-const addr1 Int)

;; H
  (assert (= addr1 value5))

(declare-const o10 Int)

;; Ensures
  (assert (= (to_rep (select memory from)) o10))

(assert
;; defqtvc
 ;; File "p.ads", line 11, characters 0-0
  (not (in_range1 (+ o10 size1))))
(check-sat)
