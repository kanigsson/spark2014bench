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

(define-fun dynamic_invariant ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647))
                                    (in_range1 temp___expr_18)))

(declare-sort natural 0)

(declare-fun naturalqtint (natural) Int)

;; natural'axiom
  (assert
  (forall ((i natural))
  (and (<= 0 (naturalqtint i)) (<= (naturalqtint i) 2147483647))))

(define-fun in_range2 ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq1 (natural natural) Bool)

(declare-const dummy1 natural)

(declare-datatypes ((natural__ref 0))
(((natural__refqtmk (natural__content natural)))))
(define-fun natural__ref_natural__content__projection ((a natural__ref)) natural 
  (natural__content a))

(define-fun to_rep ((x natural)) Int (naturalqtint x))

(declare-fun of_rep (Int) natural)

;; inversion_axiom
  (assert
  (forall ((x natural)) (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x natural)) (! (in_range2 (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range2 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                            (of_rep x))) )))

(define-fun to_rep1 ((x integer)) Int (integerqtint x))

(declare-fun of_rep1 (Int) integer)

;; inversion_axiom
  (assert
  (forall ((x integer))
  (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; range_axiom
  (assert
  (forall ((x integer)) (! (in_range1 (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range1 x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
                                                              (of_rep1 x))) )))

(declare-sort index_range 0)

(declare-fun index_rangeqtint (index_range) Int)

;; index_range'axiom
  (assert
  (forall ((i index_range))
  (and (<= 1 (index_rangeqtint i)) (<= (index_rangeqtint i) 100))))

(define-fun in_range3 ((x Int)) Bool (and (<= 1 x) (<= x 100)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq2 (index_range index_range) Bool)

(declare-const dummy2 index_range)

(declare-datatypes ((index_range__ref 0))
(((index_range__refqtmk (index_range__content index_range)))))
(define-fun index_range__ref_index_range__content__projection ((a index_range__ref)) index_range 
  (index_range__content a))

(declare-datatypes ((map__ref 0))
(((map__refqtmk (map__content (Array Int natural))))))
(declare-fun slide ((Array Int natural) Int Int) (Array Int natural))

;; slide_eq
  (assert
  (forall ((a (Array Int natural)))
  (forall ((first Int))
  (! (= (slide a first first) a) :pattern ((slide a first first)) ))))

;; slide_def
  (assert
  (forall ((a (Array Int natural)))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i Int))
  (! (= (select (slide a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
  (slide a old_first new_first) i)) ))))))

(define-fun bool_eq ((a (Array Int natural)) (a__first Int) (a__last Int)
  (b (Array Int natural)) (b__first Int)
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
  (forall ((a (Array Int natural)) (b (Array Int natural)))
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
     (and (= (to_rep1 (first (mk f l))) f) (= (to_rep1 (last (mk f l))) l)))) :pattern (
  (mk f l)) )))

(define-fun dynamic_property ((range_first Int) (range_last Int) (low Int)
  (high Int)) Bool (and (in_range1 low)
                   (and (in_range1 high)
                   (=> (<= low high) (and (in_range3 low) (in_range3 high))))))

(declare-datatypes ((us_t 0))
(((us_tqtmk (elts (Array Int natural))(rt t)))))
(define-fun to_array ((a us_t)) (Array Int natural) (elts a))

(define-fun of_array ((a (Array Int natural)) (f Int)
  (l Int)) us_t (us_tqtmk a (mk f l)))

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

(declare-datatypes ((nat_array__ref 0))
(((nat_array__refqtmk (nat_array__content us_t)))))
(define-fun nat_array__ref_nat_array__content__projection ((a nat_array__ref)) us_t 
  (nat_array__content a))

(declare-const a us_t)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const b us_t)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const r__first integer)

(declare-const r__last integer)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-const attr__ATTRIBUTE_ADDRESS4 Int)

(define-fun dynamic_invariant1 ((temp___expr_168 us_t)
  (temp___is_init_164 Bool) (temp___skip_constant_165 Bool)
  (temp___do_toplevel_166 Bool)
  (temp___do_typ_inv_167 Bool)) Bool (=>
                                     (not (= temp___skip_constant_165 true))
                                     (dynamic_property 1 100
                                     (first1 temp___expr_168)
                                     (last1 temp___expr_168))))

(declare-datatypes ((trS__ref 0))
(((trS__refqtmk (trS__content us_t)))))
(define-fun trS__ref_trS__content__2__projection ((a1 trS__ref)) us_t 
  (trS__content a1))

(declare-datatypes ((t8b__ref 0))
(((t8b__refqtmk (t8b__content us_t)))))
(define-fun t8b__ref_t8b__content__projection ((a1 t8b__ref)) us_t (t8b__content
                                                                   a1))

(define-fun dynamic_property1 ((first_int Int) (last_int Int)
  (x Int)) Bool (and (<= first_int x) (<= x last_int)))

(declare-fun attr__ATTRIBUTE_IMAGE4 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) Int)

(declare-fun user_eq4 (integer integer) Bool)

(declare-const dummy4 integer)

(declare-datatypes ((t9b__ref 0))
(((t9b__refqtmk (t9b__content integer)))))
(define-fun t9b__ref_t9b__content__projection ((a1 t9b__ref)) integer 
  (t9b__content a1))

(declare-fun p_max_array__max_array_2__r__aggregate_def (Int Int Int) us_t)

(define-fun dynamic_invariant2 ((temp___expr_39 Int) (temp___is_init_35 Bool)
  (temp___skip_constant_36 Bool) (temp___do_toplevel_37 Bool)
  (temp___do_typ_inv_38 Bool)) Bool (=>
                                    (or (= temp___is_init_35 true)
                                    (<= 0 2147483647)) (in_range2
                                    temp___expr_39)))

(declare-const rliteral natural)

;; rliteral_axiom
  (assert (= (naturalqtint rliteral) 0))

;; def_axiom
  (assert
  (forall ((temp___283 Int) (temp___284 Int) (temp___285 Int))
  (let ((temp___282 (p_max_array__max_array_2__r__aggregate_def temp___283
                    temp___284 temp___285)))
  (=> (dynamic_invariant2 temp___283 true true true true)
  (and
  (=> (dynamic_property 1 100 temp___284 temp___285)
  (and (= (first1 temp___282) temp___284) (= (last1 temp___282) temp___285)))
  (forall ((temp___286 Int))
  (= (select (to_array temp___282) temp___286) rliteral)))))))

(define-fun dynamic_invariant3 ((temp___expr_161 Int)
  (temp___is_init_157 Bool) (temp___skip_constant_158 Bool)
  (temp___do_toplevel_159 Bool)
  (temp___do_typ_inv_160 Bool)) Bool (=>
                                     (or (= temp___is_init_157 true)
                                     (<= 1 100)) (in_range3 temp___expr_161)))

(define-fun dynamic_invariant4 ((temp___expr_242 us_t)
  (temp___is_init_238 Bool) (temp___skip_constant_239 Bool)
  (temp___do_toplevel_240 Bool)
  (temp___do_typ_inv_241 Bool)) Bool (=>
                                     (not (= temp___skip_constant_239 true))
                                     (and (dynamic_property (first1 a)
                                     (last1 a) (first1 temp___expr_242)
                                     (last1 temp___expr_242))
                                     (and
                                     (= (first1 temp___expr_242) (first1 a))
                                     (= (last1 temp___expr_242) (last1 a))))))

(define-fun default_initial_assumption ((temp___expr_244 us_t)
  (temp___skip_top_level_245 Bool)) Bool (and
                                         (= (first1 temp___expr_244) 
                                         (first1 a))
                                         (= (last1 temp___expr_244) (last1 a))))

(assert
;; defqtvc
 ;; File "p_max_array.ads", line 8, characters 0-0
  (not
  (=> (dynamic_invariant1 a true false true true)
  (=> (dynamic_invariant1 b true false true true)
  (=> (= (length a) (length b))
  (let ((temp___287 (p_max_array__max_array_2__r__aggregate_def 0 (first1 a)
                    (last1 a))))
  (=> (= (first1 temp___287) (first1 a))
  (=> (= (last1 temp___287) (last1 a))
  (=>
  (ite (<= (first1 temp___287) (last1 temp___287))
  (and (<= (first1 a) (last1 a))
  (= (- (last1 temp___287) (first1 temp___287)) (- (last1 a) (first1 a))))
  (< (last1 a) (first1 a)))
  (let ((p_max_array__max_array_2__r__assume (of_array
                                             (slide (to_array temp___287)
                                             (first1 temp___287) (first1 a))
                                             (first1 a) (last1 a))))
  (forall ((r (Array Int natural)))
  (=> (= r (to_array p_max_array__max_array_2__r__assume))
  (=> (= (to_rep1 r__first) (first1 p_max_array__max_array_2__r__assume))
  (=> (= (to_rep1 r__last) (last1 p_max_array__max_array_2__r__assume))
  (=>
  (and (dynamic_property (first1 a) (last1 a) (to_rep1 r__first)
  (to_rep1 r__last))
  (and (= (to_rep1 r__first) (first1 a)) (= (to_rep1 r__last) (last1 a))))
  (forall ((j Int))
  (=> (= j (first1 b))
  (=> (dynamic_invariant j true false true true)
  (let ((temp___290 (first1 a)))
  (forall ((i Int))
  (=> (= i temp___290)
  (=>
  (= (and (ite (<= temp___290 i) true false) (ite (<= i (last1 a)) true
                                             false)) true)
  (let ((o (- i (first1 a))))
  (=> (in_range1 o)
  (=> (in_range1 (+ o (first1 b)))
  (forall ((usf Int))
  (let ((o1 (- i 1)))
  (=> (in_range1 o1)
  (=>
  (= (and (ite (<= (first1 a) usf) true false) (ite (<= usf o1) true false)) true)
  (let ((o2 (- usf (first1 a))))
  (=> (in_range1 o2)
  (let ((o3 (+ o2 (first1 b))))
  (=> (in_range1 o3)
  (=> (and (<= (first1 b) o3) (<= o3 (last1 b)))
  (forall ((o4 Int))
  (=> (= (to_rep (select (to_array b) o3)) o4)
  (=> (and (<= (first1 a) usf) (<= usf (last1 a)))
  (forall ((o5 Int))
  (=> (= (to_rep (select (to_array a) usf)) o5)
  (=> (< o4 o5) (<= (first1 a) usf)))))))))))))))))))))))))))))))))))))))))
(check-sat)