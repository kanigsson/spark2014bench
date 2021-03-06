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

(declare-datatypes ()
((natural__ref (natural__refqtmk (natural__content natural)))))
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

(declare-sort positive 0)

(declare-fun positiveqtint (positive) Int)

;; positive'axiom
  (assert
  (forall ((i positive))
  (and (<= 1 (positiveqtint i)) (<= (positiveqtint i) 2147483647))))

(define-fun in_range3 ((x Int)) Bool (and (<= 1 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq2 (positive positive) Bool)

(declare-const dummy2 positive)

(declare-datatypes ()
((positive__ref (positive__refqtmk (positive__content positive)))))
(define-fun positive__ref_positive__content__projection ((a positive__ref)) positive 
  (positive__content a))

(define-fun dynamic_invariant1 ((temp___expr_46 Int) (temp___is_init_42 Bool)
  (temp___skip_constant_43 Bool) (temp___do_toplevel_44 Bool)
  (temp___do_typ_inv_45 Bool)) Bool (=>
                                    (or (= temp___is_init_42 true)
                                    (<= 1 2147483647)) (in_range3
                                    temp___expr_46)))

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

(declare-sort index 0)

(declare-fun indexqtint (index) Int)

;; index'axiom
  (assert
  (forall ((i index)) (and (<= 1 (indexqtint i)) (<= (indexqtint i) 100))))

(define-fun in_range4 ((x Int)) Bool (and (<= 1 x) (<= x 100)))

(declare-fun attr__ATTRIBUTE_IMAGE4 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) Int)

(declare-fun user_eq3 (index index) Bool)

(declare-const dummy3 index)

(declare-datatypes () ((index__ref (index__refqtmk (index__content index)))))
(define-fun index__ref_index__content__projection ((a index__ref)) index 
  (index__content a))

(declare-datatypes ()
((map__ref (map__refqtmk (map__content (Array Int natural))))))
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
                   (=> (<= low high) (and (in_range4 low) (in_range4 high))))))

(declare-datatypes () ((us_t (us_tqtmk (elts (Array Int natural))(rt t)))))
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

(declare-fun user_eq4 (us_t us_t) Bool)

(declare-const dummy4 us_t)

(declare-datatypes ()
((nat_array__ref (nat_array__refqtmk (nat_array__content us_t)))))
(define-fun nat_array__ref_nat_array__content__projection ((a nat_array__ref)) us_t 
  (nat_array__content a))

(declare-fun is_perm (us_t us_t) Bool)

(declare-fun is_perm__function_guard (Bool us_t us_t) Bool)

(declare-fun occ (us_t Int) Int)

(declare-fun occ__function_guard (Int us_t Int) Bool)

(define-fun dynamic_invariant2 ((temp___expr_172 us_t)
  (temp___is_init_168 Bool) (temp___skip_constant_169 Bool)
  (temp___do_toplevel_170 Bool)
  (temp___do_typ_inv_171 Bool)) Bool (=>
                                     (not (= temp___skip_constant_169 true))
                                     (dynamic_property 1 100
                                     (first1 temp___expr_172)
                                     (last1 temp___expr_172))))

;; is_perm__post_axiom
  (assert true)

;; is_perm__def_axiom
  (assert
  (forall ((a us_t) (b us_t))
  (! (and (forall ((a1 us_t) (e Int)) (occ__function_guard (occ a1 e) a1 e))
     (and (forall ((b1 us_t) (e Int)) (occ__function_guard (occ b1 e) b1 e))
     (= (= (is_perm a b) true)
     (forall ((e Int))
     (=> (and (<= 0 e) (<= e 2147483647)) (= (occ a e) (occ b e))))))) :pattern (
  (is_perm a b)) )))

(declare-const values__first integer)

(declare-const values__last integer)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const x Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const y Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-datatypes ()
((tinitS__ref (tinitS__refqtmk (tinitS__content us_t)))))
(define-fun tinitS__ref_tinitS__content__projection ((a tinitS__ref)) us_t 
  (tinitS__content a))

(declare-const init us_t)

(declare-const attr__ATTRIBUTE_ADDRESS4 Int)

(declare-const interm__first integer)

(declare-const interm__last integer)

(declare-const attr__ATTRIBUTE_ADDRESS5 Int)

(declare-fun is_set (us_t Int Int us_t) Bool)

(declare-fun is_set__function_guard (Bool us_t Int Int us_t) Bool)

(define-fun dynamic_invariant3 ((temp___expr_39 Int) (temp___is_init_35 Bool)
  (temp___skip_constant_36 Bool) (temp___do_toplevel_37 Bool)
  (temp___do_typ_inv_38 Bool)) Bool (=>
                                    (or (= temp___is_init_35 true)
                                    (<= 0 2147483647)) (in_range2
                                    temp___expr_39)))

(define-fun dynamic_invariant4 ((temp___expr_165 Int)
  (temp___is_init_161 Bool) (temp___skip_constant_162 Bool)
  (temp___do_toplevel_163 Bool)
  (temp___do_typ_inv_164 Bool)) Bool (=>
                                     (or (= temp___is_init_161 true)
                                     (<= 1 100)) (in_range4 temp___expr_165)))

;; is_set__post_axiom
  (assert true)

;; is_set__def_axiom
  (assert
  (forall ((a us_t) (r us_t))
  (forall ((i Int) (v Int))
  (! (= (= (is_set a i v r) true)
     (and
     (and (and (= (first1 r) (first1 a)) (= (last1 r) (last1 a)))
     (= (to_rep (select (to_array r) i)) v))
     (forall ((j Int))
     (=> (and (<= (first1 a) j) (<= j (last1 a)))
     (=> (not (= i j))
     (= (to_rep (select (to_array r) j)) (to_rep (select (to_array a) j)))))))) :pattern (
  (is_set a i v r)) ))))

(define-fun dynamic_invariant5 ((temp___expr_236 us_t)
  (temp___is_init_232 Bool) (temp___skip_constant_233 Bool)
  (temp___do_toplevel_234 Bool)
  (temp___do_typ_inv_235 Bool)) Bool (=>
                                     (not (= temp___skip_constant_233 true))
                                     (and (dynamic_property
                                     (to_rep1 values__first)
                                     (to_rep1 values__last)
                                     (first1 temp___expr_236)
                                     (last1 temp___expr_236))
                                     (and
                                     (= (first1 temp___expr_236) (to_rep1
                                                                 values__first))
                                     (= (last1 temp___expr_236) (to_rep1
                                                                values__last))))))

(define-fun default_initial_assumption ((temp___expr_238 us_t)
  (temp___skip_top_level_239 Bool)) Bool (and
                                         (= (first1 temp___expr_238) 
                                         (to_rep1 values__first))
                                         (= (last1 temp___expr_238) (to_rep1
                                                                    values__last))))

(declare-datatypes ()
((tintermS__ref (tintermS__refqtmk (tintermS__content us_t)))))
(define-fun tintermS__ref_tintermS__content__projection ((a tintermS__ref)) us_t 
  (tintermS__content a))

(define-fun dynamic_invariant6 ((temp___expr_246 us_t)
  (temp___is_init_242 Bool) (temp___skip_constant_243 Bool)
  (temp___do_toplevel_244 Bool)
  (temp___do_typ_inv_245 Bool)) Bool (=>
                                     (not (= temp___skip_constant_243 true))
                                     (and (dynamic_property
                                     (to_rep1 values__first)
                                     (to_rep1 values__last)
                                     (first1 temp___expr_246)
                                     (last1 temp___expr_246))
                                     (and
                                     (= (first1 temp___expr_246) (to_rep1
                                                                 values__first))
                                     (= (last1 temp___expr_246) (to_rep1
                                                                values__last))))))

(define-fun default_initial_assumption1 ((temp___expr_248 us_t)
  (temp___skip_top_level_249 Bool)) Bool (and
                                         (= (first1 temp___expr_248) 
                                         (to_rep1 values__first))
                                         (= (last1 temp___expr_248) (to_rep1
                                                                    values__last))))

(declare-sort nb_occ 0)

(declare-fun nb_occqtint (nb_occ) Int)

;; nb_occ'axiom
  (assert
  (forall ((i nb_occ)) (and (<= 0 (nb_occqtint i)) (<= (nb_occqtint i) 100))))

(define-fun in_range5 ((x1 Int)) Bool (and (<= 0 x1) (<= x1 100)))

(declare-fun attr__ATTRIBUTE_IMAGE5 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check5 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE5 (us_image) Int)

(declare-fun user_eq5 (nb_occ nb_occ) Bool)

(declare-const dummy5 nb_occ)

(declare-datatypes ()
((nb_occ__ref (nb_occ__refqtmk (nb_occ__content nb_occ)))))
(define-fun nb_occ__ref_nb_occ__content__projection ((a nb_occ__ref)) nb_occ 
  (nb_occ__content a))

(define-fun dynamic_invariant7 ((temp___expr_178 Int)
  (temp___is_init_174 Bool) (temp___skip_constant_175 Bool)
  (temp___do_toplevel_176 Bool)
  (temp___do_typ_inv_177 Bool)) Bool (=>
                                     (or (= temp___is_init_174 true)
                                     (<= 0 100)) (in_range5 temp___expr_178)))

(declare-fun remove_last (us_t) us_t)

(declare-fun remove_last__function_guard (us_t us_t) Bool)

(declare-datatypes () ((t17s__ref (t17s__refqtmk (t17s__content us_t)))))
(define-fun t17s__ref_t17s__content__projection ((a t17s__ref)) us_t 
  (t17s__content a))

;; remove_last__post_axiom
  (assert
  (forall ((a us_t))
  (! (=> (and (dynamic_invariant2 a true true true true) (< 0 (length a)))
     (let ((result (remove_last a)))
     (=> (remove_last__function_guard result a) (dynamic_invariant2 result
     true false true true)))) :pattern ((remove_last a)) )))

;; remove_last__def_axiom
  (assert
  (forall ((a us_t))
  (! (=> (dynamic_invariant2 a true true true true)
     (= (remove_last a) (let ((temp___190 (let ((temp___189 (- (last1 a) 1)))
                                          (let ((temp___188 (first1 a)))
                                          (of_array (to_array a) temp___188
                                          temp___189)))))
                        (of_array (to_array temp___190) (first1 temp___190)
                        (last1 temp___190))))) :pattern ((remove_last a)) )))

(declare-fun occ_def (us_t Int) Int)

(declare-fun occ_def__function_guard (Int us_t Int) Bool)

;; occ_def__def_axiom
  (assert
  (forall ((a us_t))
  (forall ((e Int))
  (! (=>
     (and
     (and (dynamic_invariant2 a true true true true) (dynamic_invariant3 e
     true true true true)) (occ_def__function_guard (occ_def a e) a e))
     (and
     (forall ((a1 us_t)) (remove_last__function_guard (remove_last a1) a1))
     (and
     (forall ((a1 us_t)) (remove_last__function_guard (remove_last a1) a1))
     (and
     (forall ((a1 us_t) (e1 Int)) (occ_def__function_guard
     (occ_def (remove_last a1) e1) (remove_last a1) e1))
     (and
     (forall ((a1 us_t)) (remove_last__function_guard (remove_last a1) a1))
     (and
     (forall ((a1 us_t)) (remove_last__function_guard (remove_last a1) a1))
     (and
     (forall ((a1 us_t) (e1 Int)) (occ_def__function_guard
     (occ_def (remove_last a1) e1) (remove_last a1) e1))
     (= (occ_def a e) (ite (= (length a) 0) 0
                      (ite (= (to_rep (select (to_array a) (last1 a))) e)
                      (+ (occ_def (remove_last a) e) 1)
                      (occ_def (remove_last a) e))))))))))) :pattern (
  (occ_def a e)) ))))

;; occ_def__post_axiom
  (assert
  (forall ((a us_t))
  (forall ((e Int))
  (! (=>
     (and (dynamic_invariant2 a true true true true) (dynamic_invariant3 e
     true true true true))
     (let ((result (occ_def a e)))
     (=> (occ_def__function_guard result a e)
     (and (<= result (length a)) (dynamic_invariant7 result true false true
     true))))) :pattern ((occ_def a e)) ))))

;; occ__post_axiom
  (assert
  (forall ((a us_t))
  (forall ((e Int))
  (! (=>
     (and (dynamic_invariant2 a true true true true) (dynamic_invariant3 e
     true true true true))
     (let ((result (occ a e)))
     (=> (occ__function_guard result a e)
     (and (<= result (length a)) (dynamic_invariant7 result true false true
     true))))) :pattern ((occ a e)) ))))

;; occ__def_axiom
  (assert
  (forall ((a us_t))
  (forall ((e Int))
  (! (=>
     (and (dynamic_invariant2 a true true true true) (dynamic_invariant3 e
     true true true true))
     (and
     (forall ((a1 us_t) (e1 Int)) (occ_def__function_guard (occ_def a1 e1) a1
     e1)) (= (occ a e) (occ_def a e)))) :pattern ((occ a e)) ))))

(declare-const values (Array Int natural))

(declare-const temp Int)

(declare-const interm (Array Int natural))

(declare-const values1 (Array Int natural))

;; H
  (assert (= values1 values))

;; Assume
  (assert (dynamic_property 1 100 (to_rep1 values__first)
  (to_rep1 values__last)))

;; Assume
  (assert (dynamic_invariant1 x true false true true))

;; Assume
  (assert (dynamic_invariant1 y true false true true))

;; Assume
  (assert
  (and
  (and (and (<= (to_rep1 values__first) x) (<= x (to_rep1 values__last)))
  (and (<= (to_rep1 values__first) y) (<= y (to_rep1 values__last))))
  (not (= x y))))

;; Assume
  (assert true)

;; Assume
  (assert (dynamic_invariant temp false false true true))

;; Assert
  (assert
  (ite (<= (to_rep1 values__first) (to_rep1 values__last))
  (<= (to_rep1 values__first) (to_rep1 values__last))
  (< (to_rep1 values__last) (to_rep1 values__first))))

(declare-const o Int)

;; Ensures
  (assert (= (to_rep1 values__last) o))

(declare-const o1 Int)

;; Ensures
  (assert (= (to_rep1 values__first) o1))

(declare-const o2 Int)

;; Ensures
  (assert (= (to_rep1 values__first) o2))

(declare-const o3 Int)

;; Ensures
  (assert (= (to_rep1 values__first) o3))

;; Assume
  (assert (= (of_array (slide values o3 o2) o1 o) init))

;; Assume
  (assert (dynamic_invariant5 init true false true true))

;; Assume
  (assert (default_initial_assumption1
  (of_array interm (to_rep1 interm__first) (to_rep1 interm__last)) false))

;; Assume
  (assert
  (and (dynamic_property (to_rep1 values__first) (to_rep1 values__last)
  (to_rep1 interm__first) (to_rep1 interm__last))
  (and (= (to_rep1 interm__first) (to_rep1 values__first))
  (= (to_rep1 interm__last) (to_rep1 values__last)))))

;; Assert
  (assert (and (<= (to_rep1 values__first) x) (<= x (to_rep1 values__last))))

(declare-const o4 Int)

;; Ensures
  (assert (= (to_rep (select values x)) o4))

(declare-const temp1 Int)

;; H
  (assert (= temp1 o4))

;; Assert
  (assert (and (<= (to_rep1 values__first) y) (<= y (to_rep1 values__last))))

(declare-const o5 Int)

;; Ensures
  (assert (= (to_rep (select values y)) o5))

(declare-const o6 natural)

;; Ensures
  (assert (= (to_rep o6) o5))

;; Assert
  (assert (and (<= (to_rep1 values__first) x) (<= x (to_rep1 values__last))))

(declare-const values2 (Array Int natural))

;; H
  (assert (= values2 (store values x o6)))

;; H
  (assert
  (forall ((values3 (Array Int natural))) (is_set__function_guard
  (is_set (of_array (to_array init) (first1 init) (last1 init)) x
  (to_rep (select (to_array init) y))
  (of_array values3 (to_rep1 values__first) (to_rep1 values__last)))
  (of_array (to_array init) (first1 init) (last1 init)) x
  (to_rep (select (to_array init) y))
  (of_array values3 (to_rep1 values__first) (to_rep1 values__last)))))

;; Assert
  (assert
  (= (is_set (of_array (to_array init) (first1 init) (last1 init)) x
     (to_rep (select (to_array init) y))
     (of_array values2 (to_rep1 values__first) (to_rep1 values__last))) true))

;; Assert
  (assert
  (ite (<= (to_rep1 values__first) (to_rep1 values__last))
  (<= (to_rep1 values__first) (to_rep1 values__last))
  (< (to_rep1 values__last) (to_rep1 values__first))))

(declare-const o7 Int)

;; Ensures
  (assert (= (to_rep1 values__last) o7))

(declare-const o8 Int)

;; Ensures
  (assert (= (to_rep1 values__first) o8))

(declare-const o9 Int)

;; Ensures
  (assert (= (to_rep1 values__first) o9))

(declare-const o10 Int)

;; Ensures
  (assert (= (to_rep1 values__first) o10))

(define-fun temp___329 () us_t (of_array (slide values2 o10 o9) o8 o7))

;; Assert
  (assert
  (ite (<= (first1 temp___329) (last1 temp___329))
  (and (<= (to_rep1 interm__first) (to_rep1 interm__last))
  (= (- (last1 temp___329) (first1 temp___329)) (- (to_rep1 interm__last) 
  (to_rep1 interm__first))))
  (< (to_rep1 interm__last) (to_rep1 interm__first))))

(declare-const interm1 (Array Int natural))

;; H
  (assert (= interm1 (to_array temp___329)))

;; Ensures
  (assert (in_range2 temp1))

(declare-const o11 natural)

;; Ensures
  (assert (= (to_rep o11) temp1))

(assert
;; defqtvc
 ;; File "sort.adb", line 7, characters 0-0
  (not (<= (to_rep1 values__first) y)))
(check-sat)

(exit)
