;; produced by z3_gnatprove.drv ;;
(set-info :smt-lib-version 2.5)
(set-info :source |VC generated by SPARK 2014|)
(set-info :category industrial)
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

(declare-sort integer 0)

(declare-fun integerqtint (integer) Int)

;; integer'axiom
  (assert
  (forall ((i integer))
  (and (<= (- 2147483648) (integerqtint i)) (<= (integerqtint i) 2147483647))))

(define-fun in_range ((x Int)) Bool (and (<= (- 2147483648) x)
                                    (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Int)

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
                                    (<= (- 2147483648) 2147483647)) (in_range
                                    temp___expr_18)))

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(define-fun to_rep ((x integer)) Int (integerqtint x))

(declare-fun of_rep (Int) integer)

;; inversion_axiom
  (assert
  (forall ((x integer)) (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x integer)) (! (in_range (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                           (of_rep x))) )))

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

(declare-const i Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-sort index 0)

(declare-fun indexqtint (index) Int)

;; index'axiom
  (assert
  (forall ((i1 index)) (and (<= 1 (indexqtint i1)) (<= (indexqtint i1) 8))))

(define-fun in_range1 ((x Int)) Bool (and (<= 1 x) (<= x 8)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq1 (index index) Bool)

(declare-const dummy1 index)

(declare-datatypes () ((index__ref (index__refqtmk (index__content index)))))
(define-fun index__ref_index__content__projection ((a index__ref)) index 
  (index__content a))

(define-fun dynamic_invariant1 ((temp___expr_166 Int)
  (temp___is_init_162 Bool) (temp___skip_constant_163 Bool)
  (temp___do_toplevel_164 Bool)
  (temp___do_typ_inv_165 Bool)) Bool (=>
                                     (or (= temp___is_init_162 true)
                                     (<= 1 8)) (in_range1 temp___expr_166)))

(declare-fun temp_____aggregate_def_312 ((Array Int integer) Int Int Int Int
  Int) (Array Int integer))

(declare-fun temp_____aggregate_def_321 (Int) (Array Int integer))

(declare-fun temp_____aggregate_def_475 (Int) (Array Int integer))

(declare-fun temp_____aggregate_def_479 ((Array Int integer) Int Int Int Int
  Int) (Array Int integer))

(declare-const rliteral integer)

;; rliteral_axiom
  (assert (= (integerqtint rliteral) 1))

;; def_axiom
  (assert
  (forall ((temp___477 Int))
  (=> (dynamic_invariant temp___477 true true true true)
  (forall ((temp___478 Int))
  (= (select (temp_____aggregate_def_475 temp___477) temp___478) rliteral)))))

(declare-const rliteral1 integer)

;; rliteral_axiom
  (assert (= (integerqtint rliteral1) 2))

;; def_axiom
  (assert
  (forall ((temp___481 (Array Int integer)))
  (forall ((temp___482 Int) (temp___483 Int) (temp___484 Int)
  (temp___485 Int) (temp___486 Int))
  (let ((temp___480 (temp_____aggregate_def_479 temp___481 temp___482
                    temp___483 temp___484 temp___485 temp___486)))
  (=>
  (and (dynamic_invariant1 temp___482 true true true true)
  (and
  (and (dynamic_invariant temp___483 true true true true) (dynamic_invariant1
  temp___484 true true true true))
  (and (dynamic_invariant1 temp___485 true true true true) (dynamic_invariant
  temp___486 true true true true))))
  (forall ((temp___487 Int))
  (ite (and (<= temp___484 temp___487) (<= temp___487 temp___485))
  (= (to_rep (select temp___480 temp___487)) temp___486)
  (ite (= temp___487 temp___482) (= (select temp___480 temp___487) rliteral1)
  (= (select temp___480 temp___487) (select temp___481 temp___487))))))))))

;; def_axiom
  (assert
  (forall ((temp___323 Int))
  (=> (dynamic_invariant temp___323 true true true true)
  (forall ((temp___324 Int))
  (= (select (temp_____aggregate_def_321 temp___323) temp___324) rliteral)))))

;; def_axiom
  (assert
  (forall ((temp___314 (Array Int integer)))
  (forall ((temp___315 Int) (temp___316 Int) (temp___317 Int)
  (temp___318 Int) (temp___319 Int))
  (let ((temp___313 (temp_____aggregate_def_312 temp___314 temp___315
                    temp___316 temp___317 temp___318 temp___319)))
  (=>
  (and (dynamic_invariant1 temp___315 true true true true)
  (and
  (and (dynamic_invariant temp___316 true true true true) (dynamic_invariant1
  temp___317 true true true true))
  (and (dynamic_invariant1 temp___318 true true true true) (dynamic_invariant
  temp___319 true true true true))))
  (forall ((temp___320 Int))
  (ite (and (<= temp___317 temp___320) (<= temp___320 temp___318))
  (= (to_rep (select temp___313 temp___320)) temp___319)
  (ite (= temp___320 temp___315) (= (select temp___313 temp___320) rliteral1)
  (= (select temp___313 temp___320) (select temp___314 temp___320))))))))))

(declare-const x Int)

(declare-const a (Array Int integer))

;; Assume
  (assert (dynamic_invariant x true false true true))

;; Assume
  (assert true)

;; Assume
  (assert (dynamic_invariant1 i true false true true))

(declare-const a1 (Array Int integer))

;; H
  (assert (= a1 (temp_____aggregate_def_475 1)))

(declare-const a2 (Array Int integer))

;; H
  (assert (= a2 (temp_____aggregate_def_479 a1 i 2 4 5 x)))

(assert
;; defqtvc
 ;; File "arrays.ads", line 60, characters 0-0
  (not
  (= (bool_eq a2 1 8
     (temp_____aggregate_def_312 (temp_____aggregate_def_321 1) i 2 4 5 x) 1
     8) true)))
(check-sat)