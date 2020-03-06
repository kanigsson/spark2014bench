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

(declare-sort tindexB 0)

(declare-fun tindexBqtint (tindexB) Int)

;; tindexB'axiom
  (assert
  (forall ((i tindexB))
  (and (<= (- 128) (tindexBqtint i)) (<= (tindexBqtint i) 127))))

(define-fun in_range2 ((x Int)) Bool (and (<= (- 128) x) (<= x 127)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq1 (tindexB tindexB) Bool)

(declare-const dummy1 tindexB)

(declare-datatypes ()
((tindexB__ref (tindexB__refqtmk (tindexB__content tindexB)))))
(define-fun tindexB__ref_tindexB__content__projection ((a tindexB__ref)) tindexB 
  (tindexB__content a))

(declare-const a__first tindexB)

(declare-const a__last tindexB)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const i Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const j Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const k Int)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-const l Int)

(declare-const attr__ATTRIBUTE_ADDRESS4 Int)

(declare-const new_val Int)

(declare-const attr__ATTRIBUTE_ADDRESS5 Int)

(define-fun to_rep1 ((x tindexB)) Int (tindexBqtint x))

(declare-fun of_rep1 (Int) tindexB)

;; inversion_axiom
  (assert
  (forall ((x tindexB))
  (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; range_axiom
  (assert
  (forall ((x tindexB)) (! (in_range2 (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range2 x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
                                                              (of_rep1 x))) )))

(declare-sort index 0)

(declare-fun indexqtint (index) Int)

;; index'axiom
  (assert
  (forall ((i1 index)) (and (<= 1 (indexqtint i1)) (<= (indexqtint i1) 8))))

(define-fun in_range3 ((x Int)) Bool (and (<= 1 x) (<= x 8)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq2 (index index) Bool)

(declare-const dummy2 index)

(declare-datatypes () ((index__ref (index__refqtmk (index__content index)))))
(define-fun index__ref_index__content__projection ((a index__ref)) index 
  (index__content a))

(define-fun dynamic_invariant1 ((temp___expr_159 Int)
  (temp___is_init_155 Bool) (temp___skip_constant_156 Bool)
  (temp___do_toplevel_157 Bool)
  (temp___do_typ_inv_158 Bool)) Bool (=>
                                     (or (= temp___is_init_155 true)
                                     (<= 1 8)) (in_range3 temp___expr_159)))

(declare-sort t 0)

(declare-fun first (t) tindexB)

(declare-fun last (t) tindexB)

(declare-fun mk (Int Int) t)

;; mk_def
  (assert
  (forall ((f Int) (l1 Int))
  (! (=> (in_range2 f)
     (=> (in_range2 l1)
     (and (= (to_rep1 (first (mk f l1))) f)
     (= (to_rep1 (last (mk f l1))) l1)))) :pattern ((mk f l1)) )))

(define-fun dynamic_property ((range_first Int) (range_last Int) (low Int)
  (high Int)) Bool (and (in_range2 low)
                   (and (in_range2 high)
                   (=> (<= low high) (and (in_range3 low) (in_range3 high))))))

(declare-datatypes () ((us_t (us_tqtmk (elts (Array Int integer))(rt t)))))
(define-fun to_array ((a us_t)) (Array Int integer) (elts a))

(define-fun of_array ((a (Array Int integer)) (f Int)
  (l1 Int)) us_t (us_tqtmk a (mk f l1)))

(define-fun first1 ((a us_t)) Int (to_rep1 (first (rt a))))

(define-fun last1 ((a us_t)) Int (to_rep1 (last (rt a))))

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
  (y us_t)) Bool (bool_eq (elts x) (to_rep1 (first (rt x)))
                 (to_rep1 (last (rt x))) (elts y) (to_rep1 (first (rt y)))
                 (to_rep1 (last (rt y)))))

(declare-fun user_eq3 (us_t us_t) Bool)

(declare-const dummy3 us_t)

(declare-datatypes ()
((array_u__ref (array_u__refqtmk (array_u__content us_t)))))
(define-fun array_u__ref_array_u__content__projection ((a array_u__ref)) us_t 
  (array_u__content a))

(define-fun dynamic_property1 ((first_int Int) (last_int Int)
  (x Int)) Bool (and (<= first_int x) (<= x last_int)))

(declare-fun attr__ATTRIBUTE_IMAGE4 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) Int)

(declare-fun user_eq4 (tindexB tindexB) Bool)

(declare-const dummy4 tindexB)

(declare-datatypes ()
((tS4bP1__ref (tS4bP1__refqtmk (tS4bP1__content tindexB)))))
(define-fun tS4bP1__ref_tS4bP1__content__projection ((a tS4bP1__ref)) tindexB 
  (tS4bP1__content a))

(declare-fun temp_____aggregate_def_361 (us_t Int Int Int Int Int Int
  Int) us_t)

(define-fun dynamic_invariant2 ((temp___expr_166 us_t)
  (temp___is_init_162 Bool) (temp___skip_constant_163 Bool)
  (temp___do_toplevel_164 Bool)
  (temp___do_typ_inv_165 Bool)) Bool (=>
                                     (not (= temp___skip_constant_163 true))
                                     (dynamic_property 1 8
                                     (first1 temp___expr_166)
                                     (last1 temp___expr_166))))

(declare-const rliteral integer)

;; rliteral_axiom
  (assert (= (integerqtint rliteral) 0))

;; def_axiom
  (assert
  (forall ((temp___363 us_t))
  (forall ((temp___364 Int) (temp___365 Int) (temp___366 Int)
  (temp___367 Int) (temp___368 Int) (temp___369 Int) (temp___370 Int))
  (let ((temp___362 (temp_____aggregate_def_361 temp___363 temp___364
                    temp___365 temp___366 temp___367 temp___368 temp___369
                    temp___370)))
  (=>
  (and
  (and (dynamic_invariant2 temp___363 true true true true)
  (dynamic_invariant1 temp___364 true true true true))
  (and
  (and
  (and (dynamic_invariant1 temp___365 true true true true) (dynamic_invariant
  temp___366 true true true true)) (dynamic_invariant1 temp___367 true true
  true true))
  (and
  (and (dynamic_invariant1 temp___368 true true true true)
  (dynamic_invariant1 temp___369 true true true true)) (dynamic_invariant
  temp___370 true true true true))))
  (and
  (and (= (first1 temp___362) (first1 temp___363))
  (= (last1 temp___362) (last1 temp___363)))
  (forall ((temp___371 Int))
  (ite (or (and (<= temp___367 temp___371) (<= temp___371 temp___368))
       (= temp___371 temp___369))
  (= (to_rep (select (to_array temp___362) temp___371)) temp___370)
  (ite (and (<= temp___364 temp___371) (<= temp___371 temp___365))
  (= (select (to_array temp___362) temp___371) rliteral)
  (= (select (to_array temp___362) temp___371) (select (to_array temp___363) temp___371)))))))))))

(declare-const a (Array Int integer))

(declare-const a1 (Array Int integer))

;; H
  (assert (= a1 a))

;; Assume
  (assert (dynamic_property 1 8 (to_rep1 a__first) (to_rep1 a__last)))

;; Assume
  (assert (dynamic_invariant1 i true false true true))

;; Assume
  (assert (dynamic_invariant1 j true false true true))

;; Assume
  (assert (dynamic_invariant1 k true false true true))

;; Assume
  (assert (dynamic_invariant1 l true false true true))

;; Assume
  (assert (dynamic_invariant new_val true false true true))

(define-fun o () Int l)

(declare-const o1 Int)

;; Ensures
  (assert (= (to_rep1 a__last) o1))

(declare-const o2 Int)

;; Ensures
  (assert (= (to_rep1 a__first) o2))

;; Ensures
  (assert (dynamic_property1 o2 o1 o))

(define-fun o3 () Int k)

(declare-const o4 Int)

;; Ensures
  (assert (= (to_rep1 a__last) o4))

(declare-const o5 Int)

;; Ensures
  (assert (= (to_rep1 a__first) o5))

(assert
;; defqtvc
 ;; File "update_checks_1.ads", line 14, characters 0-0
  (not (dynamic_property1 o5 o4 o3)))
(check-sat)