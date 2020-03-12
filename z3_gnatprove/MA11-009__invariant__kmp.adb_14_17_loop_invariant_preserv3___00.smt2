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

(declare-sort t 0)

(declare-fun first (t) integer)

(declare-fun last (t) integer)

(declare-fun mk (Int Int) t)

;; mk_def
  (assert
  (forall ((f Int) (l Int))
  (! (=> (in_range1 f)
     (=> (in_range1 l)
     (and (= (to_rep (first (mk f l))) f) (= (to_rep (last (mk f l))) l)))) :pattern (
  (mk f l)) )))

(define-fun dynamic_property ((range_first Int) (range_last Int) (low Int)
  (high Int)) Bool (and (in_range1 low)
                   (and (in_range1 high)
                   (=> (<= low high) (and (in_range1 low) (in_range1 high))))))

(declare-datatypes () ((us_t (us_tqtmk (elts (Array Int integer))(rt t)))))
(define-fun to_array ((a us_t)) (Array Int integer) (elts a))

(define-fun of_array ((a (Array Int integer)) (f Int)
  (l Int)) us_t (us_tqtmk a (mk f l)))

(define-fun first1 ((a us_t)) Int (to_rep (first (rt a))))

(define-fun last1 ((a us_t)) Int (to_rep (last (rt a))))

(define-fun length ((a us_t)) Int (ite (<= (first1 a) (last1 a))
                                  (+ (- (last1 a) (first1 a)) 1) 0))

(declare-const value__size Int)

(declare-const object__size Int)

(declare-const component__size Int)

(declare-const alignment Int)

;; value__size_axiom
  (assert (<= 0 value__size))

;; object__size_axiom
  (assert (<= 0 object__size))

;; component__size_axiom
  (assert (<= 0 component__size))

;; alignment_axiom
  (assert (<= 0 alignment))

(define-fun bool_eq1 ((x us_t)
  (y us_t)) Bool (bool_eq (elts x) (to_rep (first (rt x)))
                 (to_rep (last (rt x))) (elts y) (to_rep (first (rt y)))
                 (to_rep (last (rt y)))))

(declare-fun user_eq1 (us_t us_t) Bool)

(declare-const dummy1 us_t)

(declare-datatypes () ((a__ref (a__refqtmk (a__content us_t)))))
(define-fun a__ref_a__content__projection ((a a__ref)) us_t (a__content a))

(declare-const p us_t)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const next__first integer)

(declare-const next__last integer)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-const attr__ATTRIBUTE_ADDRESS4 Int)

(declare-const attr__ATTRIBUTE_ADDRESS5 Int)

(declare-const attr__ATTRIBUTE_ADDRESS6 Int)

(define-fun dynamic_invariant1 ((temp___expr_160 us_t)
  (temp___is_init_156 Bool) (temp___skip_constant_157 Bool)
  (temp___do_toplevel_158 Bool)
  (temp___do_typ_inv_159 Bool)) Bool (=>
                                     (not (= temp___skip_constant_157 true))
                                     (dynamic_property (- 2147483648)
                                     2147483647 (first1 temp___expr_160)
                                     (last1 temp___expr_160))))

(declare-datatypes ()
((tnextS__ref (tnextS__refqtmk (tnextS__content us_t)))))
(define-fun tnextS__ref_tnextS__content__projection ((a tnextS__ref)) us_t 
  (tnextS__content a))

(declare-datatypes () ((t3b__ref (t3b__refqtmk (t3b__content us_t)))))
(define-fun t3b__ref_t3b__content__projection ((a t3b__ref)) us_t (t3b__content
                                                                  a))

(declare-datatypes () ((t11b__ref (t11b__refqtmk (t11b__content us_t)))))
(define-fun t11b__ref_t11b__content__projection ((a t11b__ref)) us_t 
  (t11b__content a))

(declare-datatypes () ((t14b__ref (t14b__refqtmk (t14b__content us_t)))))
(define-fun t14b__ref_t14b__content__projection ((a t14b__ref)) us_t 
  (t14b__content a))

(declare-fun kmp__init_next__next__aggregate_def (Int Int Int) us_t)

(declare-const rliteral integer)

;; rliteral_axiom
  (assert (= (integerqtint rliteral) 0))

;; def_axiom
  (assert
  (forall ((temp___185 Int) (temp___186 Int) (temp___187 Int))
  (let ((temp___184 (kmp__init_next__next__aggregate_def temp___185
                    temp___186 temp___187)))
  (=> (dynamic_invariant temp___185 true true true true)
  (and
  (=> (dynamic_property (- 2147483648) 2147483647 temp___186 temp___187)
  (and (= (first1 temp___184) temp___186) (= (last1 temp___184) temp___187)))
  (forall ((temp___188 Int))
  (= (select (to_array temp___184) temp___188) rliteral)))))))

(define-fun dynamic_invariant2 ((temp___expr_178 us_t)
  (temp___is_init_174 Bool) (temp___skip_constant_175 Bool)
  (temp___do_toplevel_176 Bool)
  (temp___do_typ_inv_177 Bool)) Bool (=>
                                     (not (= temp___skip_constant_175 true))
                                     (and (dynamic_property (first1 p)
                                     (last1 p) (first1 temp___expr_178)
                                     (last1 temp___expr_178))
                                     (and
                                     (= (first1 temp___expr_178) (first1 p))
                                     (= (last1 temp___expr_178) (last1 p))))))

(define-fun default_initial_assumption ((temp___expr_180 us_t)
  (temp___skip_top_level_181 Bool)) Bool (and
                                         (= (first1 temp___expr_180) 
                                         (first1 p))
                                         (= (last1 temp___expr_180) (last1 p))))

(declare-const j Int)

;; Assume
  (assert (dynamic_invariant1 p true false true true))

;; Assume
  (assert (<= 1 (length p)))

(define-fun temp___189 () us_t (kmp__init_next__next__aggregate_def 0
                               (first1 p) (last1 p)))

;; Assume
  (assert (= (first1 temp___189) (first1 p)))

;; Assume
  (assert (= (last1 temp___189) (last1 p)))

;; Assert
  (assert
  (ite (<= (first1 temp___189) (last1 temp___189))
  (and (<= (first1 p) (last1 p))
  (= (- (last1 temp___189) (first1 temp___189)) (- (last1 p) (first1 p))))
  (< (last1 p) (first1 p))))

(define-fun kmp__init_next__next__assume () us_t (of_array
                                                 (slide (to_array temp___189)
                                                 (first1 temp___189)
                                                 (first1 p)) (first1 p)
                                                 (last1 p)))

(declare-const next (Array Int integer))

;; H
  (assert (= next (to_array kmp__init_next__next__assume)))

;; Assume
  (assert (= (to_rep next__first) (first1 kmp__init_next__next__assume)))

;; Assume
  (assert (= (to_rep next__last) (last1 kmp__init_next__next__assume)))

;; Assume
  (assert
  (and (dynamic_property (first1 p) (last1 p) (to_rep next__first)
  (to_rep next__last))
  (and (= (to_rep next__first) (first1 p)) (= (to_rep next__last) (last1 p)))))

(declare-const i Int)

;; H
  (assert (= i (first1 p)))

;; Assume
  (assert (dynamic_invariant i true false true true))

;; Assume
  (assert true)

;; Assume
  (assert (dynamic_invariant j false false true true))

(declare-const spark__branch Bool)

;; H
  (assert (= spark__branch (ite (< 1 (length p)) true false)))

;; H
  (assert (= spark__branch true))

(define-fun o () Int (+ (first1 p) 1))

;; Ensures
  (assert (in_range1 o))

(declare-const j1 Int)

;; H
  (assert (= j1 o))

(define-fun o1 () Int (- (last1 p) 1))

;; Ensures
  (assert (in_range1 o1))

;; H
  (assert
  (= (and (ite (<= (first1 p) i) true false) (ite (<= i o1) true false)) true))

(define-fun o2 () Int (- i j1))

;; Ensures
  (assert (in_range1 o2))

(declare-const r8b Int)

;; H
  (assert (= r8b o2))

;; Assume
  (assert (dynamic_invariant r8b true false true true))

(declare-const r9b Int)

;; H
  (assert (= r9b j1))

;; Assume
  (assert (dynamic_invariant r9b true false true true))

(define-fun o3 () Int (- j1 1))

;; Ensures
  (assert (in_range1 o3))

(declare-const r12b Int)

;; H
  (assert (= r12b o3))

;; Assume
  (assert (dynamic_invariant r12b true false true true))

(declare-const next1 (Array Int integer))

(declare-const i1 Int)

(declare-const j2 Int)

(declare-const r8b1 Int)

(declare-const r9b1 Int)

(declare-const r12b1 Int)

;; LoopInvariant
  (assert (and (and (<= (first1 p) j2) (<= j2 (last1 p))) (< i1 j2)))

;; LoopInvariant
  (assert
  (= (let ((temp___207 (of_array (to_array p) 0 r12b1)))
     (let ((temp___206 (of_array (to_array p) r8b1 r9b1)))
     (bool_eq (to_array temp___206) (first1 temp___206) (last1 temp___206)
     (to_array temp___207) (first1 temp___207) (last1 temp___207)))) true))

;; Assume
  (assert
  (and
  (and
  (and
  (and (dynamic_invariant j2 false true true true) (dynamic_invariant 
  i1 true true true true)) (= (- i1 j2) r8b1)) (= j2 r9b1))
  (= (- j2 1) r12b1)))

(declare-const next2 (Array Int integer))

(declare-const i2 Int)

(declare-const j3 Int)

;; Assert
  (assert (and (<= (first1 p) j2) (<= j2 (last1 p))))

(declare-const o4 Int)

;; Ensures
  (assert (= (to_rep (select (to_array p) j2)) o4))

;; Assert
  (assert (and (<= (first1 p) i1) (<= i1 (last1 p))))

(declare-const o5 Int)

;; Ensures
  (assert (= (to_rep (select (to_array p) i1)) o5))

(declare-const spark__branch1 Bool)

;; H
  (assert (= spark__branch1 (ite (= o5 o4) true false)))

(declare-const spark__branch2 Bool)

(declare-const o6 Int)

(declare-const o7 integer)

;; H
  (assert
  (ite (= spark__branch1 true)
  (let ((o8 (+ i1 1)))
  (and (in_range1 o8)
  (and (= i2 o8)
  (let ((o9 (+ j2 1)))
  (and (in_range1 o9)
  (and (= j3 o9)
  (and (= (to_rep o7) j3)
  (and (and (<= (to_rep next__first) i2) (<= i2 (to_rep next__last)))
  (= next2 (store next1 i2 o7))))))))))
  (and (= spark__branch2 (ite (= j2 (first1 p)) true false))
  (ite (= spark__branch2 true)
  (and
  (let ((o8 (+ i1 1)))
  (and (in_range1 o8)
  (and (= i2 o8)
  (and (and (<= (to_rep next__first) i2) (<= i2 (to_rep next__last)))
  (= next2 (store next1 i2 rliteral)))))) (= j3 j2))
  (and
  (and
  (and (and (<= (to_rep next__first) j2) (<= j2 (to_rep next__last)))
  (and (= (to_rep (select next1 j2)) o6) (= j3 o6))) (= next2 next1))
  (= i2 i1))))))

(define-fun o8 () Int (- (last1 p) 1))

;; Ensures
  (assert (in_range1 o8))

;; H
  (assert
  (= (and (ite (<= (first1 p) i2) true false) (ite (<= i2 o8) true false)) true))

(define-fun o9 () Int (- i2 j3))

;; Ensures
  (assert (in_range1 o9))

(declare-const r8b2 Int)

;; H
  (assert (= r8b2 o9))

;; Assume
  (assert (dynamic_invariant r8b2 true false true true))

(declare-const r9b2 Int)

;; H
  (assert (= r9b2 j3))

;; Assume
  (assert (dynamic_invariant r9b2 true false true true))

(define-fun o10 () Int (- j3 1))

;; Ensures
  (assert (in_range1 o10))

(declare-const r12b2 Int)

;; H
  (assert (= r12b2 o10))

;; Assume
  (assert (dynamic_invariant r12b2 true false true true))

(assert
;; defqtvc
 ;; File "kmp.ads", line 7, characters 0-0
  (not (<= (first1 p) j3)))
(check-sat)
