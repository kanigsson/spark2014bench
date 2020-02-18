;; produced by cvc4_16.drv ;;
(set-logic AUFBVFPDTNIRA)
(set-info :smt-lib-version 2.6)
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

(declare-datatypes ((integer__ref 0))
(((integer__refqtmk (integer__content integer)))))
(define-fun integer__ref_integer__content__projection ((a integer__ref)) integer 
  (integer__content a))

(define-fun dynamic_invariant ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647)) (in_range
                                    temp___expr_18)))

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

(declare-fun f (tuple0) Int)

(declare-fun f__function_guard (Int tuple0) Bool)

;; f__post_axiom
  (assert
  (forall ((us_void_param tuple0))
  (! (let ((result (f us_void_param)))
     (=> (f__function_guard result us_void_param) (dynamic_invariant result
     true false true true))) :pattern ((f us_void_param)) )))

(declare-const r4b Int)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-datatypes ((map__ref 0))
(((map__refqtmk (map__content (Array Int integer))))))
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

(declare-const a__first integer)

(declare-const a__last integer)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const c8b (Array Int integer))

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-sort tvec_10_subP1 0)

(declare-fun tvec_10_subP1qtint (tvec_10_subP1) Int)

;; tvec_10_subP1'axiom
  (assert
  (forall ((i tvec_10_subP1))
  (and (<= 0 (tvec_10_subP1qtint i)) (<= (tvec_10_subP1qtint i) 10))))

(define-fun in_range1 ((x Int)) Bool (and (<= 0 x) (<= x 10)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq1 (tvec_10_subP1 tvec_10_subP1) Bool)

(declare-const dummy1 tvec_10_subP1)

(declare-datatypes ((tvec_10_subP1__ref 0))
(((tvec_10_subP1__refqtmk (tvec_10_subP1__content tvec_10_subP1)))))
(define-fun tvec_10_subP1__ref_tvec_10_subP1__content__projection ((a tvec_10_subP1__ref)) tvec_10_subP1 
  (tvec_10_subP1__content a))

(declare-sort t 0)

(declare-fun first (t) integer)

(declare-fun last (t) integer)

(declare-fun mk (Int Int) t)

;; mk_def
  (assert
  (forall ((f1 Int) (l Int))
  (! (=> (in_range f1)
     (=> (in_range l)
     (and (= (to_rep (first (mk f1 l))) f1) (= (to_rep (last (mk f1 l))) l)))) :pattern (
  (mk f1 l)) )))

(define-fun dynamic_property ((range_first Int) (range_last Int) (low Int)
  (high Int)) Bool (and (in_range low)
                   (and (in_range high)
                   (=> (<= low high) (and (in_range low) (in_range high))))))

(declare-datatypes ((us_t 0))
(((us_tqtmk (elts (Array Int integer))(rt t)))))
(define-fun to_array ((a us_t)) (Array Int integer) (elts a))

(define-fun of_array ((a (Array Int integer)) (f1 Int)
  (l Int)) us_t (us_tqtmk a (mk f1 l)))

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

(declare-fun user_eq2 (us_t us_t) Bool)

(declare-const dummy2 us_t)

(declare-datatypes ((vec__ref 0))
(((vec__refqtmk (vec__content us_t)))))
(define-fun vec__ref_vec__content__projection ((a vec__ref)) us_t (vec__content
                                                                  a))

(declare-datatypes ((taS__ref 0))
(((taS__refqtmk (taS__content us_t)))))
(define-fun taS__ref_taS__content__projection ((a taS__ref)) us_t (taS__content
                                                                  a))

(declare-datatypes ((t6b__ref 0))
(((t6b__refqtmk (t6b__content us_t)))))
(define-fun t6b__ref_t6b__content__projection ((a t6b__ref)) us_t (t6b__content
                                                                  a))

(declare-fun p__a__aggregate_def (Int Int Int) us_t)

(define-fun dynamic_invariant1 ((temp___expr_182 us_t)
  (temp___is_init_178 Bool) (temp___skip_constant_179 Bool)
  (temp___do_toplevel_180 Bool)
  (temp___do_typ_inv_181 Bool)) Bool (=>
                                     (not (= temp___skip_constant_179 true))
                                     (dynamic_property (- 2147483648)
                                     2147483647 (first1 temp___expr_182)
                                     (last1 temp___expr_182))))

(declare-const rliteral integer)

;; rliteral_axiom
  (assert (= (integerqtint rliteral) 0))

;; def_axiom
  (assert
  (forall ((temp___205 Int) (temp___206 Int) (temp___207 Int))
  (let ((temp___204 (p__a__aggregate_def temp___205 temp___206 temp___207)))
  (=> (dynamic_invariant temp___205 true true true true)
  (and
  (=> (dynamic_property (- 2147483648) 2147483647 temp___206 temp___207)
  (and (= (first1 temp___204) temp___206) (= (last1 temp___204) temp___207)))
  (forall ((temp___208 Int))
  (= (select (to_array temp___204) temp___208) rliteral)))))))

(define-fun dynamic_invariant2 ((temp___expr_198 us_t)
  (temp___is_init_194 Bool) (temp___skip_constant_195 Bool)
  (temp___do_toplevel_196 Bool)
  (temp___do_typ_inv_197 Bool)) Bool (=>
                                     (not (= temp___skip_constant_195 true))
                                     (and (dynamic_property r4b 10
                                     (first1 temp___expr_198)
                                     (last1 temp___expr_198))
                                     (and (= (first1 temp___expr_198) 
                                     r4b) (= (last1 temp___expr_198) 10)))))

(define-fun default_initial_assumption ((temp___expr_200 us_t)
  (temp___skip_top_level_201 Bool)) Bool (and
                                         (= (first1 temp___expr_200) 
                                         r4b) (= (last1 temp___expr_200) 10)))

;; r4b__def_axiom
  (assert (and (f__function_guard (f Tuple0) Tuple0) (= r4b (f Tuple0))))

(assert
;; defqtvc
 ;; File "p.adb", line 1, characters 0-0
  (not
  (let ((p__R4b__assume (f Tuple0)))
  (=>
  (and (f__function_guard p__R4b__assume Tuple0) (dynamic_invariant
  p__R4b__assume true false true true))
  (=> (= p__R4b__assume r4b)
  (=> (dynamic_invariant r4b true false true true)
  (=> (<= r4b 10) (<= (- 2147483648) r4b))))))))
(check-sat)