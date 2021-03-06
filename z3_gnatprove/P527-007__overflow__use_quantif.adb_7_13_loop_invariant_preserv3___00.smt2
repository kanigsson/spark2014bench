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

(declare-fun id (Int) Int)

(declare-fun id__function_guard (Int Int) Bool)

;; id__post_axiom
  (assert (forall ((x Int)) (! (in_range1 (id x)) :pattern ((id x)) )))

(declare-const fst Int)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const lst Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

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

(declare-const first Int)

(declare-const last Int)

(define-fun dynamic_property ((first_int Int) (last_int Int)
  (x Int)) Bool (and (<= first_int x) (<= x last_int)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq1 (integer integer) Bool)

(declare-const dummy1 integer)

(declare-datatypes ()
((index_type__ref (index_type__refqtmk (index_type__content integer)))))
(define-fun index_type__ref_index_type__content__projection ((a index_type__ref)) integer 
  (index_type__content a))

(declare-const first_index Int)

(declare-const attr__ATTRIBUTE_ADDRESS4 Int)

(declare-const last_index Int)

(declare-const attr__ATTRIBUTE_ADDRESS5 Int)

(define-fun dynamic_invariant1 ((temp___expr_166 Int)
  (temp___is_init_162 Bool) (temp___skip_constant_163 Bool)
  (temp___do_toplevel_164 Bool)
  (temp___do_typ_inv_165 Bool)) Bool (=>
                                     (or (= temp___is_init_162 true)
                                     (<= first last)) (dynamic_property 
                                     first last temp___expr_166)))

;; first__def_axiom
  (assert (= first first_index))

;; last__def_axiom
  (assert (= last last_index))

(define-fun dynamic_property1 ((first_int Int) (last_int Int)
  (x Int)) Bool (and (<= first_int x) (<= x last_int)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq2 (integer integer) Bool)

(declare-const dummy2 integer)

(declare-datatypes () ((t1b__ref (t1b__refqtmk (t1b__content integer)))))
(define-fun t1b__ref_t1b__content__projection ((a t1b__ref)) integer 
  (t1b__content a))

(declare-const one Int)

(declare-const attr__ATTRIBUTE_ADDRESS6 Int)

;; first_index__def_axiom
  (assert (= first_index one))

(declare-const lst1 Int)

(declare-const attr__ATTRIBUTE_ADDRESS7 Int)

;; last_index__def_axiom
  (assert (= last_index lst1))

;; Assume
  (assert (dynamic_invariant1 fst true false true true))

;; Assume
  (assert (dynamic_invariant1 lst true false true true))

;; Assume
  (assert (<= fst lst))

(declare-const g Int)

;; H
  (assert (= g 0))

;; Assume
  (assert (dynamic_invariant g true false true true))

(define-fun temp___169 () Int fst)

(define-fun temp___170 () Int lst)

(declare-const i Int)

;; H
  (assert (= i temp___169))

;; H
  (assert
  (= (and (ite (<= temp___169 i) true false) (ite (<= i temp___170) true
                                             false)) true))

(declare-const g1 Int)

(declare-const i1 Int)

;; H
  (assert (forall ((j Int)) (id__function_guard (id j) j)))

;; LoopInvariant
  (assert
  (forall ((j Int)) (=> (and (<= first j) (<= j (- fst 2))) (= (id j) j))))

;; H
  (assert
  (= (and (ite (and (dynamic_invariant g1 true true true true)
               (dynamic_property1 fst lst i1))
          true false) (ite (and (<= fst i1) (<= i1 lst)) true false)) true))

;; H
  (assert (not (= i1 temp___170)))

(declare-const j Int)

;; H
  (assert (<= first j))

;; H
  (assert (<= j (- fst 2)))

;; H
  (assert (forall ((j1 Int)) (id__function_guard (id j1) j1)))

(assert
;; defqtvc
 ;; File "use_quantif.ads", line 20, characters 0-0
  (not (= (id j) j)))
(check-sat)

(exit)
