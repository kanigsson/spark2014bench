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

(declare-sort index 0)

(declare-fun indexqtint (index) Int)

;; index'axiom
  (assert
  (forall ((i index)) (and (<= 1 (indexqtint i)) (<= (indexqtint i) 8))))

(define-fun in_range1 ((x Int)) Bool (and (<= 1 x) (<= x 8)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq (index index) Bool)

(declare-const dummy index)

(declare-datatypes ((index__ref 0))
(((index__refqtmk (index__content index)))))
(define-fun index__ref_index__content__projection ((a index__ref)) index 
  (index__content a))

(define-fun to_rep ((x index)) Int (indexqtint x))

(declare-fun of_rep (Int) index)

;; inversion_axiom
  (assert
  (forall ((x index)) (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x index)) (! (in_range1 (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range1 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                            (of_rep x))) )))

(declare-datatypes ((map__ref 0))
(((map__refqtmk (map__content (Array Int index))))))
(declare-fun slide ((Array Int index) Int Int) (Array Int index))

;; slide_eq
  (assert
  (forall ((a (Array Int index)))
  (forall ((first Int))
  (! (= (slide a first first) a) :pattern ((slide a first first)) ))))

;; slide_def
  (assert
  (forall ((a (Array Int index)))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i Int))
  (! (= (select (slide a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
  (slide a old_first new_first) i)) ))))))

(define-fun bool_eq ((a (Array Int index)) (a__first Int) (a__last Int)
  (b (Array Int index)) (b__first Int)
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
  (forall ((a (Array Int index)) (b (Array Int index)))
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

(declare-const b (Array Int index))

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const i Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const c (Array Int index))

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-const attr__ATTRIBUTE_ADDRESS4 Int)

(declare-const attr__ATTRIBUTE_ADDRESS5 Int)

(define-fun dynamic_invariant ((temp___expr_162 Int)
  (temp___is_init_158 Bool) (temp___skip_constant_159 Bool)
  (temp___do_toplevel_160 Bool)
  (temp___do_typ_inv_161 Bool)) Bool (=>
                                     (or (= temp___is_init_158 true)
                                     (<= 1 8)) (in_range1 temp___expr_162)))

(declare-sort integer 0)

(declare-fun integerqtint (integer) Int)

;; integer'axiom
  (assert
  (forall ((i1 integer))
  (and (<= (- 2147483648) (integerqtint i1))
  (<= (integerqtint i1) 2147483647))))

(define-fun in_range2 ((x Int)) Bool (and (<= (- 2147483648) x)
                                     (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq1 (integer integer) Bool)

(declare-const dummy1 integer)

(declare-datatypes ((integer__ref 0))
(((integer__refqtmk (integer__content integer)))))
(define-fun integer__ref_integer__content__projection ((a integer__ref)) integer 
  (integer__content a))

(define-fun to_rep1 ((x integer)) Int (integerqtint x))

(declare-fun of_rep1 (Int) integer)

;; inversion_axiom
  (assert
  (forall ((x integer))
  (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; range_axiom
  (assert
  (forall ((x integer)) (! (in_range2 (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range2 x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
                                                              (of_rep1 x))) )))

(define-fun dynamic_property ((first_int Int) (last_int Int)
  (x Int)) Bool (and (<= first_int x) (<= x last_int)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq2 (integer integer) Bool)

(declare-const dummy2 integer)

(declare-datatypes ((t6b__ref 0))
(((t6b__refqtmk (t6b__content integer)))))
(define-fun t6b__ref_t6b__content__projection ((a t6b__ref)) integer 
  (t6b__content a))

(define-fun dynamic_property1 ((first_int Int) (last_int Int)
  (x Int)) Bool (and (<= first_int x) (<= x last_int)))

(declare-fun attr__ATTRIBUTE_IMAGE4 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) Int)

(declare-fun user_eq3 (integer integer) Bool)

(declare-const dummy3 integer)

(declare-datatypes ((t11b__ref 0))
(((t11b__refqtmk (t11b__content integer)))))
(define-fun t11b__ref_t11b__content__projection ((a t11b__ref)) integer 
  (t11b__content a))

(declare-fun queen__copy_until__r__aggregate_def (Int) (Array Int index))

(define-fun dynamic_invariant1 ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647))
                                    (in_range2 temp___expr_18)))

(declare-const rliteral index)

;; rliteral_axiom
  (assert (= (indexqtint rliteral) 1))

;; def_axiom
  (assert
  (forall ((temp___213 Int))
  (=> (dynamic_invariant temp___213 true true true true)
  (forall ((temp___214 Int))
  (= (select (queen__copy_until__r__aggregate_def temp___213) temp___214) 
  rliteral)))))

(assert
;; defqtvc
 ;; File "queen.ads", line 44, characters 0-0
  (not
  (forall ((r (Array Int index)) (r1 (Array Int index)))
  (=> (dynamic_invariant i true false true true)
  (=> (= r (queen__copy_until__r__aggregate_def 1))
  (=>
  (let ((temp___216 i))
  (exists ((j Int))
  (and (= j 1)
  (ite (= (and (ite (<= 1 j) true false) (ite (<= j temp___216) true false)) true)
  (exists ((r2 (Array Int index)) (j1 Int))
  (and
  (forall ((k Int))
  (=> (and (<= 1 k) (<= k (- j1 1)))
  (= (to_rep (select r2 k)) (to_rep (select b k)))))
  (and
  (= (and (ite (and
               (forall ((temp___218 Int))
               (=> (and (<= 1 temp___218) (<= temp___218 8))
               (=>
               (or (< temp___216 temp___218)
               (or (< temp___218 1) (<= j1 temp___218)))
               (= (select r2 temp___218) (select r temp___218)))))
               (dynamic_property 1 i j1))
          true false) (ite (and (<= 1 j1) (<= j1 i)) true false)) true)
  (exists ((o Int))
  (and (= (to_rep (select b j1)) o)
  (exists ((o1 index))
  (and (= (to_rep o1) o) (and (= r1 (store r2 j1 o1)) (= j1 temp___216)))))))))
  (= r1 r)))))
  (let ((temp___221 (+ i 1)))
  (forall ((j Int))
  (=> (= j temp___221)
  (=>
  (= (and (ite (<= temp___221 j) true false) (ite (<= j 8) true false)) true)
  (forall ((r2 (Array Int index)) (j1 Int))
  (=>
  (forall ((k Int))
  (=> (and (<= 1 k) (<= k i))
  (= (to_rep (select r2 k)) (to_rep (select b k)))))
  (=>
  (= (and (ite (and
               (forall ((temp___224 Int))
               (=> (and (<= 1 temp___224) (<= temp___224 8))
               (=>
               (or (< 8 temp___224)
               (or (< temp___224 temp___221) (<= j1 temp___224)))
               (= (select r2 temp___224) (select r1 temp___224)))))
               (dynamic_property1 (+ i 1) 8 j1))
          true false) (ite (and (<= (+ i 1) j1) (<= j1 8)) true false)) true)
  (forall ((o Int))
  (=> (= (to_rep (select c j1)) o)
  (forall ((o1 index))
  (=> (= (to_rep o1) o)
  (forall ((r3 (Array Int index)))
  (=> (= r3 (store r2 j1 o1))
  (=> (not (= j1 8))
  (forall ((k Int))
  (=> (and (<= 1 k) (<= k i))
  (= (to_rep (select r3 k)) (to_rep (select b k)))))))))))))))))))))))))
(check-sat)
(exit)
