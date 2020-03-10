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

(define-fun in_range ((x Int)) Bool (or (= x 0) (= x 1)))

(declare-fun attr__ATTRIBUTE_IMAGE (Bool) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Bool)

(declare-sort integer_32 0)

(declare-fun integer_32qtint (integer_32) Int)

;; integer_32'axiom
  (assert
  (forall ((i integer_32))
  (and (<= (- 2147483648) (integer_32qtint i))
  (<= (integer_32qtint i) 2147483647))))

(define-fun in_range1 ((x Int)) Bool (and (<= (- 2147483648) x)
                                     (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq (integer_32 integer_32) Bool)

(declare-const dummy integer_32)

(declare-datatypes ((integer_32__ref 0))
(((integer_32__refqtmk (integer_32__content integer_32)))))
(define-fun integer_32__ref_integer_32__content__2__projection ((a integer_32__ref)) integer_32 
  (integer_32__content a))

(define-fun to_rep ((x integer_32)) Int (integer_32qtint x))

(declare-fun of_rep (Int) integer_32)

;; inversion_axiom
  (assert
  (forall ((x integer_32))
  (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x integer_32)) (! (in_range1 (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range1 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                            (of_rep x))) )))

(declare-datatypes ((map__ref 0))
(((map__refqtmk (map__content (Array Int integer_32))))))
(declare-fun slide ((Array Int integer_32) Int Int) (Array Int integer_32))

;; slide_eq
  (assert
  (forall ((a (Array Int integer_32)))
  (forall ((first Int))
  (! (= (slide a first first) a) :pattern ((slide a first first)) ))))

;; slide_def
  (assert
  (forall ((a (Array Int integer_32)))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i Int))
  (! (= (select (slide a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
  (slide a old_first new_first) i)) ))))))

(define-fun bool_eq ((a (Array Int integer_32)) (a__first Int) (a__last Int)
  (b (Array Int integer_32)) (b__first Int)
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
  (forall ((a (Array Int integer_32)) (b (Array Int integer_32)))
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

(declare-const x (Array Int integer_32))

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const y (Array Int integer_32))

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-sort tinteger_32B 0)

(declare-fun tinteger_32Bqtint (tinteger_32B) Int)

;; tinteger_32B'axiom
  (assert
  (forall ((i tinteger_32B))
  (and (<= (- 2147483648) (tinteger_32Bqtint i))
  (<= (tinteger_32Bqtint i) 2147483647))))

(define-fun in_range2 ((x1 Int)) Bool (and (<= (- 2147483648) x1)
                                      (<= x1 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq1 (tinteger_32B tinteger_32B) Bool)

(declare-const dummy1 tinteger_32B)

(declare-datatypes ((tinteger_32B__ref 0))
(((tinteger_32B__refqtmk (tinteger_32B__content tinteger_32B)))))
(define-fun tinteger_32B__ref_tinteger_32B__content__projection ((a tinteger_32B__ref)) tinteger_32B 
  (tinteger_32B__content a))

(define-fun dynamic_invariant ((temp___expr_181 Int)
  (temp___is_init_177 Bool) (temp___skip_constant_178 Bool)
  (temp___do_toplevel_179 Bool)
  (temp___do_typ_inv_180 Bool)) Bool (=>
                                     (or (= temp___is_init_177 true)
                                     (<= (- 2147483648) 2147483647))
                                     (in_range1 temp___expr_181)))

(assert
;; defqtvc
 ;; File "langley.adb", line 5, characters 0-0
  (not
  (forall ((i Int) (o Int) (o1 Int))
  (=>
  (forall ((i1 Int))
  (=> (and (<= 0 i1) (<= i1 9))
  (and
  (and
  (and (< (to_rep (select x i1)) 1073741824)
  (< (- 1073741824) (to_rep (select x i1))))
  (< (to_rep (select y i1)) 1073741824))
  (< (- 1073741824) (to_rep (select y i1))))))
  (=> (= i 0)
  (=> (= (to_rep (select y i)) o)
  (=> (= (to_rep (select x i)) o1) (in_range2 (+ o1 o)))))))))
(check-sat)
(exit)
