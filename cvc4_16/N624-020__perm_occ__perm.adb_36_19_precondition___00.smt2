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

(declare-sort natural 0)

(declare-fun naturalqtint (natural) Int)

;; natural'axiom
  (assert
  (forall ((i natural))
  (and (<= 0 (naturalqtint i)) (<= (naturalqtint i) 2147483647))))

(define-fun in_range1 ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq (natural natural) Bool)

(declare-const dummy natural)

(declare-datatypes ((natural__ref 0))
(((natural__refqtmk (natural__content natural)))))
(define-fun natural__ref_natural__content__projection ((a natural__ref)) natural 
  (natural__content a))

(define-fun dynamic_invariant ((temp___expr_39 Int) (temp___is_init_35 Bool)
  (temp___skip_constant_36 Bool) (temp___do_toplevel_37 Bool)
  (temp___do_typ_inv_38 Bool)) Bool (=>
                                    (or (= temp___is_init_35 true)
                                    (<= 0 2147483647)) (in_range1
                                    temp___expr_39)))

(define-fun to_rep ((x natural)) Int (naturalqtint x))

(declare-fun of_rep (Int) natural)

;; inversion_axiom
  (assert
  (forall ((x natural)) (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x natural)) (! (in_range1 (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range1 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                            (of_rep x))) )))

(declare-sort integer 0)

(declare-fun integerqtint (integer) Int)

;; integer'axiom
  (assert
  (forall ((i integer))
  (and (<= (- 2147483648) (integerqtint i)) (<= (integerqtint i) 2147483647))))

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

(declare-sort index 0)

(declare-fun indexqtint (index) Int)

;; index'axiom
  (assert
  (forall ((i index)) (and (<= 1 (indexqtint i)) (<= (indexqtint i) 100))))

(define-fun in_range3 ((x Int)) Bool (and (<= 1 x) (<= x 100)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq2 (index index) Bool)

(declare-const dummy2 index)

(declare-datatypes ((index__ref 0))
(((index__refqtmk (index__content index)))))
(define-fun index__ref_index__content__projection ((a index__ref)) index 
  (index__content a))

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
  (! (=> (in_range2 f)
     (=> (in_range2 l)
     (and (= (to_rep1 (first (mk f l))) f) (= (to_rep1 (last (mk f l))) l)))) :pattern (
  (mk f l)) )))

(define-fun dynamic_property ((range_first Int) (range_last Int) (low Int)
  (high Int)) Bool (and (in_range2 low)
                   (and (in_range2 high)
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

(declare-fun remove_last (us_t) us_t)

(declare-fun remove_last__function_guard (us_t us_t) Bool)

(define-fun dynamic_invariant1 ((temp___expr_178 us_t)
  (temp___is_init_174 Bool) (temp___skip_constant_175 Bool)
  (temp___do_toplevel_176 Bool)
  (temp___do_typ_inv_177 Bool)) Bool (=>
                                     (not (= temp___skip_constant_175 true))
                                     (dynamic_property 1 100
                                     (first1 temp___expr_178)
                                     (last1 temp___expr_178))))

(declare-datatypes ((t17s__ref 0))
(((t17s__refqtmk (t17s__content us_t)))))
(define-fun t17s__ref_t17s__content__projection ((a t17s__ref)) us_t 
  (t17s__content a))

;; remove_last__post_axiom
  (assert
  (forall ((a us_t))
  (! (=> (and (dynamic_invariant1 a true true true true) (< 0 (length a)))
     (let ((result (remove_last a)))
     (=> (remove_last__function_guard result a) (dynamic_invariant1 result
     true false true true)))) :pattern ((remove_last a)) )))

;; remove_last__def_axiom
  (assert
  (forall ((a us_t))
  (! (=> (dynamic_invariant1 a true true true true)
     (= (remove_last a) (let ((temp___189 (let ((temp___188 (- (last1 a) 1)))
                                          (let ((temp___187 (first1 a)))
                                          (of_array (to_array a) temp___187
                                          temp___188)))))
                        (of_array (to_array temp___189) (first1 temp___189)
                        (last1 temp___189))))) :pattern ((remove_last a)) )))

(declare-fun occ (us_t Int) Int)

(declare-fun occ__function_guard (Int us_t Int) Bool)

(declare-fun occ_def (us_t Int) Int)

(declare-fun occ_def__function_guard (Int us_t Int) Bool)

(declare-sort nb_occ 0)

(declare-fun nb_occqtint (nb_occ) Int)

;; nb_occ'axiom
  (assert
  (forall ((i nb_occ)) (and (<= 0 (nb_occqtint i)) (<= (nb_occqtint i) 100))))

(define-fun in_range4 ((x Int)) Bool (and (<= 0 x) (<= x 100)))

(declare-fun attr__ATTRIBUTE_IMAGE4 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) Int)

(declare-fun user_eq4 (nb_occ nb_occ) Bool)

(declare-const dummy4 nb_occ)

(declare-datatypes ((nb_occ__ref 0))
(((nb_occ__refqtmk (nb_occ__content nb_occ)))))
(define-fun nb_occ__ref_nb_occ__content__projection ((a nb_occ__ref)) nb_occ 
  (nb_occ__content a))

(define-fun dynamic_invariant2 ((temp___expr_164 Int)
  (temp___is_init_160 Bool) (temp___skip_constant_161 Bool)
  (temp___do_toplevel_162 Bool)
  (temp___do_typ_inv_163 Bool)) Bool (=>
                                     (or (= temp___is_init_160 true)
                                     (<= 0 100)) (in_range4 temp___expr_164)))

;; occ__post_axiom
  (assert
  (forall ((a us_t))
  (forall ((e Int))
  (! (=>
     (and (dynamic_invariant1 a true true true true) (dynamic_invariant e
     true true true true))
     (let ((result (occ a e)))
     (=> (occ__function_guard result a e)
     (and (<= result (length a)) (dynamic_invariant2 result true false true
     true))))) :pattern ((occ a e)) ))))

;; occ__def_axiom
  (assert
  (forall ((a us_t))
  (forall ((e Int))
  (! (=>
     (and (dynamic_invariant1 a true true true true) (dynamic_invariant e
     true true true true))
     (and
     (forall ((a1 us_t) (e1 Int)) (occ_def__function_guard (occ_def a1 e1) a1
     e1)) (= (occ a e) (occ_def a e)))) :pattern ((occ a e)) ))))

(declare-fun is_set (us_t Int Int us_t) Bool)

(declare-fun is_set__function_guard (Bool us_t Int Int us_t) Bool)

(define-fun dynamic_invariant3 ((temp___expr_171 Int)
  (temp___is_init_167 Bool) (temp___skip_constant_168 Bool)
  (temp___do_toplevel_169 Bool)
  (temp___do_typ_inv_170 Bool)) Bool (=>
                                     (or (= temp___is_init_167 true)
                                     (<= 1 100)) (in_range3 temp___expr_171)))

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

(declare-const a us_t)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const i Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const v Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const e Int)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-const r us_t)

(declare-const attr__ATTRIBUTE_ADDRESS4 Int)

(declare-const b__first integer)

(declare-const b__last integer)

(declare-const attr__ATTRIBUTE_ADDRESS5 Int)

(define-fun dynamic_invariant4 ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647))
                                    (in_range2 temp___expr_18)))

;; occ_def__def_axiom
  (assert
  (forall ((a1 us_t))
  (forall ((e1 Int))
  (! (=>
     (and
     (and (dynamic_invariant1 a1 true true true true) (dynamic_invariant e1
     true true true true)) (occ_def__function_guard (occ_def a1 e1) a1 e1))
     (and
     (forall ((a2 us_t)) (remove_last__function_guard (remove_last a2) a2))
     (and
     (forall ((a2 us_t)) (remove_last__function_guard (remove_last a2) a2))
     (and
     (forall ((a2 us_t) (e2 Int)) (occ_def__function_guard
     (occ_def (remove_last a2) e2) (remove_last a2) e2))
     (and
     (forall ((a2 us_t)) (remove_last__function_guard (remove_last a2) a2))
     (and
     (forall ((a2 us_t)) (remove_last__function_guard (remove_last a2) a2))
     (and
     (forall ((a2 us_t) (e2 Int)) (occ_def__function_guard
     (occ_def (remove_last a2) e2) (remove_last a2) e2))
     (= (occ_def a1 e1) (ite (= (length a1) 0) 0
                        (ite (= (to_rep (select (to_array a1) (last1 a1))) e1)
                        (+ (occ_def (remove_last a1) e1) 1)
                        (occ_def (remove_last a1) e1))))))))))) :pattern (
  (occ_def a1 e1)) ))))

;; occ_def__post_axiom
  (assert
  (forall ((a1 us_t))
  (forall ((e1 Int))
  (! (=>
     (and (dynamic_invariant1 a1 true true true true) (dynamic_invariant e1
     true true true true))
     (let ((result (occ_def a1 e1)))
     (=> (occ_def__function_guard result a1 e1)
     (and (<= result (length a1)) (dynamic_invariant2 result true false true
     true))))) :pattern ((occ_def a1 e1)) ))))

(assert
;; defqtvc
 ;; File "perm.ads", line 30, characters 0-0
  (not
  (=> (dynamic_invariant1 a true false true true)
  (=> (dynamic_invariant3 i true false true true)
  (=> (dynamic_invariant v true false true true)
  (=> (dynamic_invariant e true false true true)
  (=> (dynamic_invariant1 r true false true true)
  (=> (<= (first1 a) i)
  (=> (<= i (last1 a))
  (=> (is_set__function_guard (is_set a i v r) a i v r)
  (=> (= (is_set a i v r) true)
  (let ((o a))
  (let ((perm__occ_set__b__assume (remove_last o)))
  (=>
  (and (remove_last__function_guard perm__occ_set__b__assume o)
  (and (dynamic_invariant1 perm__occ_set__b__assume true false true true)
  (= perm__occ_set__b__assume (let ((temp___183 (of_array (to_array o)
                                                (first1 o) (- (last1 o) 1))))
                              (of_array (to_array temp___183)
                              (first1 temp___183) (last1 temp___183))))))
  (forall ((b (Array Int natural)))
  (=> (= b (to_array perm__occ_set__b__assume))
  (=> (= (to_rep1 b__first) (first1 perm__occ_set__b__assume))
  (=> (= (to_rep1 b__last) (last1 perm__occ_set__b__assume))
  (=> (dynamic_property 1 100 (to_rep1 b__first) (to_rep1 b__last))
  (forall ((spark__branch Bool))
  (=> (= spark__branch (ite (= (length a) 0) true false))
  (=> (not (= spark__branch true))
  (forall ((spark__branch1 Bool))
  (=> (= spark__branch1 (ite (= i (last1 a)) true false))
  (=> (not (= spark__branch1 true))
  (forall ((o1 natural))
  (=> (= (to_rep o1) v)
  (=> (and (<= (to_rep1 b__first) i) (<= i (to_rep1 b__last)))
  (forall ((b1 (Array Int natural)))
  (=> (= b1 (store b i o1))
  (let ((o2 e))
  (forall ((o3 Int))
  (=> (= (to_rep1 b__last) o3)
  (forall ((o4 Int))
  (=> (= (to_rep1 b__first) o4)
  (let ((o5 r))
  (let ((o6 (remove_last o5)))
  (=>
  (and (remove_last__function_guard o6 o5)
  (and (dynamic_invariant1 o6 true false true true)
  (= o6 (let ((temp___183 (of_array (to_array o5) (first1 o5)
                          (- (last1 o5) 1))))
        (of_array (to_array temp___183) (first1 temp___183)
        (last1 temp___183))))))
  (=> (forall ((o7 Int) (o8 us_t)) (occ__function_guard (occ o8 o7) o8 o7))
  (=> (forall ((o7 Int) (o8 us_t)) (occ__function_guard (occ o8 o7) o8 o7))
  (=> (= (occ o6 o2) (occ (of_array b1 o4 o3) o2))
  (forall ((o7 Int))
  (=> (= (to_rep1 b__last) o7)
  (forall ((o8 Int)) (=> (= (to_rep1 b__first) o8) (< 0 (length a)))))))))))))))))))))))))))))))))))))))))))))))
(check-sat)
(exit)
