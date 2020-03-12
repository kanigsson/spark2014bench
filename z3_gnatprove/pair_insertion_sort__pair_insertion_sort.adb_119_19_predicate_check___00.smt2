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

(define-fun length ((x Int) (y Int)) Int (ite (<= x y) (+ (- y x) 1) 0))

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

(declare-sort index 0)

(declare-fun indexqtint (index) Int)

;; index'axiom
  (assert
  (forall ((i index))
  (and (<= 0 (indexqtint i)) (<= (indexqtint i) 2147483646))))

(define-fun in_range2 ((x Int)) Bool (and (<= 0 x) (<= x 2147483646)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq1 (index index) Bool)

(declare-const dummy1 index)

(declare-datatypes () ((index__ref (index__refqtmk (index__content index)))))
(define-fun index__ref_index__content__projection ((a index__ref)) index 
  (index__content a))

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
                   (=> (<= low high) (and (in_range2 low) (in_range2 high))))))

(declare-datatypes () ((us_t (us_tqtmk (elts (Array Int integer))(rt t)))))
(define-fun to_array ((a us_t)) (Array Int integer) (elts a))

(define-fun of_array ((a (Array Int integer)) (f Int)
  (l Int)) us_t (us_tqtmk a (mk f l)))

(define-fun first1 ((a us_t)) Int (to_rep (first (rt a))))

(define-fun last1 ((a us_t)) Int (to_rep (last (rt a))))

(define-fun length1 ((a us_t)) Int (ite (<= (first1 a) (last1 a))
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

(declare-datatypes () ((arr__ref (arr__refqtmk (arr__content us_t)))))
(define-fun arr__ref_arr__content__projection ((a arr__ref)) us_t (arr__content
                                                                  a))

(declare-fun sorted (us_t Int Int) Bool)

(declare-fun sorted__function_guard (Bool us_t Int Int) Bool)

(define-fun dynamic_invariant1 ((temp___expr_173 us_t)
  (temp___is_init_169 Bool) (temp___skip_constant_170 Bool)
  (temp___do_toplevel_171 Bool)
  (temp___do_typ_inv_172 Bool)) Bool (and
                                     (=>
                                     (not (= temp___skip_constant_170 true))
                                     (dynamic_property 0 2147483646
                                     (first1 temp___expr_173)
                                     (last1 temp___expr_173)))
                                     (=> (= temp___do_toplevel_171 true)
                                     (=> (= temp___is_init_169 true)
                                     (= (first1 temp___expr_173) 0)))))

(define-fun dynamic_predicate ((temp___176 us_t)) Bool (= (first1 temp___176) 0))

;; sorted__post_axiom
  (assert true)

;; sorted__def_axiom
  (assert
  (forall ((a us_t))
  (forall ((i Int) (j Int))
  (! (= (= (sorted a i j) true)
     (forall ((k Int))
     (=> (and (<= i k) (<= k (- j 1)))
     (<= (to_rep (select (to_array a) k)) (to_rep
                                          (select (to_array a) (+ k 1))))))) :pattern (
  (sorted a i j)) ))))

(declare-const a__first integer)

(declare-const a__last integer)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-fun is_perm (us_t us_t) Bool)

(declare-fun is_perm__function_guard (Bool us_t us_t) Bool)

(declare-fun occ (us_t Int) Int)

(declare-fun occ__function_guard (Int us_t Int) Bool)

;; is_perm__post_axiom
  (assert true)

;; is_perm__def_axiom
  (assert
  (forall ((a us_t) (b us_t))
  (! (= (= (is_perm a b) true)
     (forall ((e Int))
     (=> (and (<= (- 2147483648) e) (<= e 2147483647))
     (= (occ a e) (occ b e))))) :pattern ((is_perm a b)) )))

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-const attr__ATTRIBUTE_ADDRESS4 Int)

(declare-const attr__ATTRIBUTE_ADDRESS5 Int)

(declare-datatypes () ((tbS__ref (tbS__refqtmk (tbS__content us_t)))))
(define-fun tbS__ref_tbS__content__projection ((a tbS__ref)) us_t (tbS__content
                                                                  a))

(declare-const b us_t)

(declare-const attr__ATTRIBUTE_ADDRESS6 Int)

(define-fun dynamic_invariant2 ((temp___expr_284 us_t)
  (temp___is_init_280 Bool) (temp___skip_constant_281 Bool)
  (temp___do_toplevel_282 Bool)
  (temp___do_typ_inv_283 Bool)) Bool (and
                                     (=>
                                     (not (= temp___skip_constant_281 true))
                                     (and (dynamic_property (to_rep a__first)
                                     (to_rep a__last)
                                     (first1 temp___expr_284)
                                     (last1 temp___expr_284))
                                     (and
                                     (= (first1 temp___expr_284) (to_rep
                                                                 a__first))
                                     (= (last1 temp___expr_284) (to_rep
                                                                a__last)))))
                                     (=> (= temp___is_init_280 true)
                                     (= (first1 temp___expr_284) 0))))

(define-fun default_initial_assumption ((temp___expr_288 us_t)
  (temp___skip_top_level_289 Bool)) Bool (and
                                         (= (first1 temp___expr_288) 
                                         (to_rep a__first))
                                         (= (last1 temp___expr_288) (to_rep
                                                                    a__last))))

(define-fun dynamic_predicate1 ((temp___292 us_t)) Bool (= (first1
                                                           temp___292) 0))

(define-fun dynamic_invariant3 ((temp___expr_166 Int)
  (temp___is_init_162 Bool) (temp___skip_constant_163 Bool)
  (temp___do_toplevel_164 Bool)
  (temp___do_typ_inv_165 Bool)) Bool (=>
                                     (or (= temp___is_init_162 true)
                                     (<= 0 2147483646)) (in_range2
                                     temp___expr_166)))

(declare-sort nb_occ 0)

(declare-fun nb_occqtint (nb_occ) Int)

;; nb_occ'axiom
  (assert
  (forall ((i nb_occ))
  (and (<= 0 (nb_occqtint i)) (<= (nb_occqtint i) 2147483647))))

(define-fun in_range3 ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq3 (nb_occ nb_occ) Bool)

(declare-const dummy3 nb_occ)

(declare-datatypes ()
((nb_occ__ref (nb_occ__refqtmk (nb_occ__content nb_occ)))))
(define-fun nb_occ__ref_nb_occ__content__projection ((a nb_occ__ref)) nb_occ 
  (nb_occ__content a))

(define-fun dynamic_invariant4 ((temp___expr_184 Int)
  (temp___is_init_180 Bool) (temp___skip_constant_181 Bool)
  (temp___do_toplevel_182 Bool)
  (temp___do_typ_inv_183 Bool)) Bool (=>
                                     (or (= temp___is_init_180 true)
                                     (<= 0 2147483647)) (in_range3
                                     temp___expr_184)))

(declare-fun remove_last (us_t) us_t)

(declare-fun remove_last__function_guard (us_t us_t) Bool)

(declare-datatypes () ((t17s__ref (t17s__refqtmk (t17s__content us_t)))))
(define-fun t17s__ref_t17s__content__projection ((a t17s__ref)) us_t 
  (t17s__content a))

;; remove_last__post_axiom
  (assert
  (forall ((a us_t))
  (! (=> (and (dynamic_invariant1 a true true true true) (< 0 (length1 a)))
     (dynamic_invariant1 (remove_last a) true false true true)) :pattern (
  (remove_last a)) )))

;; remove_last__def_axiom
  (assert
  (forall ((a us_t))
  (! (=> (dynamic_invariant1 a true true true true)
     (= (remove_last a) (let ((temp___196 (let ((temp___195 (- (last1 a) 1)))
                                          (let ((temp___194 (first1 a)))
                                          (of_array (to_array a) temp___194
                                          temp___195)))))
                        (of_array (to_array temp___196) (first1 temp___196)
                        (last1 temp___196))))) :pattern ((remove_last a)) )))

(declare-fun occ_def (us_t Int) Int)

(declare-fun occ_def__function_guard (Int us_t Int) Bool)

;; occ_def__def_axiom
  (assert
  (forall ((a us_t))
  (forall ((e Int))
  (! (=>
     (and (dynamic_invariant1 a true true true true) (dynamic_invariant e
     true true true true))
     (= (occ_def a e) (ite (= (length1 a) 0) 0
                      (ite (= (to_rep (select (to_array a) (last1 a))) e)
                      (+ (occ_def (remove_last a) e) 1)
                      (occ_def (remove_last a) e))))) :pattern ((occ_def a e)) ))))

;; occ_def__post_axiom
  (assert
  (forall ((a us_t))
  (forall ((e Int))
  (! (=>
     (and (dynamic_invariant1 a true true true true) (dynamic_invariant e
     true true true true))
     (let ((result (occ_def a e)))
     (and (<= result (length1 a)) (dynamic_invariant4 result true false true
     true)))) :pattern ((occ_def a e)) ))))

;; occ__post_axiom
  (assert
  (forall ((a us_t))
  (forall ((e Int))
  (! (=>
     (and (dynamic_invariant1 a true true true true) (dynamic_invariant e
     true true true true))
     (let ((result (occ a e)))
     (and (<= result (length1 a)) (dynamic_invariant4 result true false true
     true)))) :pattern ((occ a e)) ))))

;; occ__def_axiom
  (assert
  (forall ((a us_t))
  (forall ((e Int))
  (! (=>
     (and (dynamic_invariant1 a true true true true) (dynamic_invariant e
     true true true true)) (= (occ a e) (occ_def a e))) :pattern ((occ a e)) ))))

(declare-const spark__branch Bool)

(declare-const a (Array Int integer))

(declare-const i Int)

(declare-const j Int)

(declare-const x Int)

(declare-const y Int)

(declare-const z Int)

(declare-const a1 (Array Int integer))

;; H
  (assert (= a1 a))

;; Assume
  (assert
  (and (dynamic_property 0 2147483646 (to_rep a__first) (to_rep a__last))
  (= (to_rep a__first) 0)))

;; Assume
  (assert true)

;; Assume
  (assert (dynamic_invariant i false false true true))

;; Assume
  (assert true)

;; Assume
  (assert (dynamic_invariant j false false true true))

;; Assume
  (assert true)

;; Assume
  (assert (dynamic_invariant x false false true true))

;; Assume
  (assert true)

;; Assume
  (assert (dynamic_invariant y false false true true))

;; Assume
  (assert true)

;; Assume
  (assert (dynamic_invariant z false false true true))

;; Assert
  (assert
  (ite (<= (to_rep a__first) (to_rep a__last))
  (<= (to_rep a__first) (to_rep a__last))
  (< (to_rep a__last) (to_rep a__first))))

(declare-const o Int)

;; Ensures
  (assert (= (to_rep a__last) o))

(declare-const o1 Int)

;; Ensures
  (assert (= (to_rep a__first) o1))

(declare-const o2 Int)

;; Ensures
  (assert (= (to_rep a__first) o2))

(declare-const o3 Int)

;; Ensures
  (assert (= (to_rep a__first) o3))

(define-fun temp___296 () us_t (of_array (slide a o3 o2) o1 o))

;; Assert
  (assert (dynamic_predicate1 temp___296))

;; Assume
  (assert (= temp___296 b))

;; Assume
  (assert (dynamic_invariant2 b true false true true))

(declare-const i1 Int)

;; H
  (assert (= i1 0))

(declare-const spark__branch1 Bool)

(declare-const a2 (Array Int integer))

(declare-const i2 Int)

(declare-const j1 Int)

(declare-const y1 Int)

(declare-const o4 Int)

;; Ensures
  (assert (= (to_rep a__last) o4))

(declare-const o5 Int)

;; Ensures
  (assert (= (to_rep a__first) o5))

;; H
  (assert (in_range1 (length o5 o4)))

;; H
  (assert
  (ite (< i1 (- (length o5 o4) 1))
  (and (and (<= (to_rep a__first) i1) (<= i1 (to_rep a__last)))
  (exists ((o6 Int))
  (and (= (to_rep (select a i1)) o6)
  (exists ((x1 Int))
  (and (= x1 o6)
  (let ((o7 (+ i1 1)))
  (and (in_range1 o7)
  (and (and (<= (to_rep a__first) o7) (<= o7 (to_rep a__last)))
  (exists ((o8 Int))
  (and (= (to_rep (select a o7)) o8)
  (exists ((y2 Int))
  (and (= y2 o8)
  (exists ((spark__branch2 Bool) (x2 Int) (y3 Int) (z1 Int))
  (and
  (and (= spark__branch2 (ite (< x1 y2) true false))
  (ite (= spark__branch2 true) (and (= z1 x1) (and (= x2 y2) (= y3 z1)))
  (and (and (= x2 x1) (= y3 y2)) (= z1 z))))
  (let ((o9 (- i1 1)))
  (and (in_range1 o9)
  (exists ((j2 Int))
  (and (= j2 o9)
  (exists ((a3 (Array Int integer)) (j3 Int))
  (and
  (exists ((o10 Bool))
  (and
  (ite (<= 0 j2)
  (and (and (<= (to_rep a__first) j2) (<= j2 (to_rep a__last)))
  (exists ((o11 Int))
  (and (= (to_rep (select a j2)) o11) (= o10 (ite (< x2 o11) true false)))))
  (= o10 false))
  (ite (= o10 true)
  (and (in_range2 j2)
  (let ((o11 (+ j2 2)))
  (and (in_range1 o11)
  (and (in_range2 o11)
  (let ((o12 a__last))
  (let ((o13 a__first))
  (exists ((a4 (Array Int integer)) (o14 (Array Int integer)))
  (and (= o14 a4)
  (and
  (and
  (and
  (and
  (and
  (= (is_perm (of_array a (to_rep o13) (to_rep o12))
     (of_array o14 (to_rep o13) (to_rep o12))) true)
  (= (to_rep (select o14 o11)) (to_rep (select a j2))))
  (= (to_rep (select o14 j2)) (to_rep (select a o11))))
  (forall ((z2 Int))
  (=> (and (<= (to_rep o13) z2) (<= z2 (to_rep o12)))
  (=> (and (not (= z2 o11)) (not (= z2 j2)))
  (= (to_rep (select o14 z2)) (to_rep (select a z2))))))) (= (to_rep o13) 0))
  (and (= (to_rep a__first) 0)
  (exists ((o15 Int))
  (and (= (to_rep a__last) o15)
  (exists ((o16 Int))
  (and (= (to_rep a__first) o16)
  (and (in_range1 (length o16 o15))
  (exists ((j4 Int))
  (and
  (and
  (and (<= 0 j4) (<= j4 (- (length (to_rep a__first) (to_rep a__last)) 3)))
  (and
  (= (sorted (of_array a3 (to_rep a__first) (to_rep a__last)) 0 (- j4 1)) true)
  (and
  (= (sorted (of_array a3 (to_rep a__first) (to_rep a__last)) (+ j4 2)
     (+ i1 1)) true)
  (and
  (=> (< 0 j4)
  (<= (to_rep (select a3 (- j4 1))) (to_rep (select a3 (+ j4 2)))))
  (and (< x2 (to_rep (select a3 (+ j4 2))))
  (and
  (= (is_perm (of_array (to_array b) (first1 b) (last1 b))
     (of_array a3 (to_rep a__first) (to_rep a__last))) true)
  (or
  (and (= (to_rep (select a3 j4)) x2) (= (to_rep (select a3 (+ j4 1))) y3))
  (and (= (to_rep (select a3 j4)) y3) (= (to_rep (select a3 (+ j4 1))) x2)))))))))
  (and
  (and (= (to_rep a__first) 0) (dynamic_invariant j4 false true true true))
  (let ((o17 (- j4 1)))
  (and (in_range1 o17)
  (and (= j3 o17)
  (exists ((o18 Bool))
  (and
  (ite (<= 0 j3)
  (and (and (<= (to_rep a__first) j3) (<= j3 (to_rep a__last)))
  (exists ((o19 Int))
  (and (= (to_rep (select a3 j3)) o19) (= o18 (ite (< x2 o19) true false)))))
  (= o18 false)) (not (= o18 true)))))))))))))))))))))))))
  (and (= a3 a) (= j3 j2)))))
  (exists ((spark__branch3 Bool) (a4 (Array Int integer)))
  (and
  (let ((o10 (+ j3 2)))
  (and (in_range1 o10)
  (and (and (<= (to_rep a__first) o10) (<= o10 (to_rep a__last)))
  (exists ((o11 Int))
  (and (= (to_rep (select a3 o10)) o11)
  (and (= spark__branch3 (ite (= o11 x2) false true))
  (ite (= spark__branch3 true)
  (let ((o12 (+ j3 1)))
  (and (in_range1 o12)
  (and (in_range2 o12)
  (let ((o13 (+ j3 2)))
  (and (in_range1 o13)
  (and (in_range2 o13)
  (let ((o14 a__last))
  (let ((o15 a__first))
  (exists ((o16 (Array Int integer)))
  (and (= o16 a4)
  (and
  (and
  (and
  (and
  (and
  (= (is_perm (of_array a3 (to_rep o15) (to_rep o14))
     (of_array o16 (to_rep o15) (to_rep o14))) true)
  (= (to_rep (select o16 o13)) (to_rep (select a3 o12))))
  (= (to_rep (select o16 o12)) (to_rep (select a3 o13))))
  (forall ((z2 Int))
  (=> (and (<= (to_rep o15) z2) (<= z2 (to_rep o14)))
  (=> (and (not (= z2 o13)) (not (= z2 o12)))
  (= (to_rep (select o16 z2)) (to_rep (select a3 z2)))))))
  (= (to_rep o15) 0)) (= (to_rep a__first) 0)))))))))))) (= a4 a3))))))))
  (exists ((a5 (Array Int integer)) (j4 Int))
  (and
  (exists ((o10 Bool))
  (and
  (ite (<= 0 j3)
  (and (and (<= (to_rep a__first) j3) (<= j3 (to_rep a__last)))
  (exists ((o11 Int))
  (and (= (to_rep (select a4 j3)) o11) (= o10 (ite (< y3 o11) true false)))))
  (= o10 false))
  (ite (= o10 true)
  (and (in_range2 j3)
  (let ((o11 (+ j3 1)))
  (and (in_range1 o11)
  (and (in_range2 o11)
  (let ((o12 a__last))
  (let ((o13 a__first))
  (exists ((a6 (Array Int integer)) (o14 (Array Int integer)))
  (and (= o14 a6)
  (and
  (and
  (and
  (and
  (and
  (= (is_perm (of_array a4 (to_rep o13) (to_rep o12))
     (of_array o14 (to_rep o13) (to_rep o12))) true)
  (= (to_rep (select o14 o11)) (to_rep (select a4 j3))))
  (= (to_rep (select o14 j3)) (to_rep (select a4 o11))))
  (forall ((z2 Int))
  (=> (and (<= (to_rep o13) z2) (<= z2 (to_rep o12)))
  (=> (and (not (= z2 o11)) (not (= z2 j3)))
  (= (to_rep (select o14 z2)) (to_rep (select a4 z2)))))))
  (= (to_rep o13) 0))
  (and (= (to_rep a__first) 0)
  (exists ((o15 Int))
  (and (= (to_rep a__last) o15)
  (exists ((o16 Int))
  (and (= (to_rep a__first) o16)
  (and (in_range1 (length o16 o15))
  (exists ((j5 Int))
  (and
  (and
  (and (<= 0 j5) (<= j5 (- (length (to_rep a__first) (to_rep a__last)) 3)))
  (and
  (= (sorted (of_array a5 (to_rep a__first) (to_rep a__last)) 0 (- j5 1)) true)
  (and
  (= (sorted (of_array a5 (to_rep a__first) (to_rep a__last)) (+ j5 1)
     (+ i1 1)) true)
  (and
  (=> (< 0 j5)
  (<= (to_rep (select a5 (- j5 1))) (to_rep (select a5 (+ j5 1)))))
  (and (< y3 (to_rep (select a5 (+ j5 1))))
  (and
  (= (is_perm (of_array (to_array b) (first1 b) (last1 b))
     (of_array a5 (to_rep a__first) (to_rep a__last))) true)
  (= (to_rep (select a5 j5)) y3)))))))
  (and
  (and (= (to_rep a__first) 0) (dynamic_invariant j5 false true true true))
  (let ((o17 (- j5 1)))
  (and (in_range1 o17)
  (and (= j4 o17)
  (exists ((o18 Bool))
  (and
  (ite (<= 0 j4)
  (and (and (<= (to_rep a__first) j4) (<= j4 (to_rep a__last)))
  (exists ((o19 Int))
  (and (= (to_rep (select a5 j4)) o19) (= o18 (ite (< y3 o19) true false)))))
  (= o18 false)) (not (= o18 true)))))))))))))))))))))))))
  (and (= a5 a4) (= j4 j3)))))
  (exists ((o10 Int))
  (and (= (to_rep a__last) o10)
  (exists ((o11 Int))
  (and (= (to_rep a__first) o11)
  (and (in_range1 (length o11 o10))
  (exists ((i3 Int) (x3 Int) (z2 Int))
  (and
  (and
  (and (<= 0 i3) (<= i3 (- (length (to_rep a__first) (to_rep a__last)) 2)))
  (and
  (and (<= (- 1) j1)
  (<= j1 (- (length (to_rep a__first) (to_rep a__last)) 3)))
  (and
  (= (sorted (of_array a2 (to_rep a__first) (to_rep a__last)) 0 (+ i3 1)) true)
  (= (is_perm (of_array (to_array b) (first1 b) (last1 b))
     (of_array a2 (to_rep a__first) (to_rep a__last))) true))))
  (and
  (and
  (and
  (and
  (and
  (and (dynamic_invariant y1 false true true true) (dynamic_invariant z2
  false true true true)) (= (to_rep a__first) 0)) (dynamic_invariant i3 false
  true true true)) (dynamic_invariant j1 false true true true))
  (dynamic_invariant x3 false true true true))
  (let ((o12 (+ i3 2)))
  (and (in_range1 o12)
  (and (= i2 o12)
  (exists ((o13 Int))
  (and (= (to_rep a__last) o13)
  (exists ((o14 Int))
  (and (= (to_rep a__first) o14)
  (let ((o15 (length o14 o13))) (and (in_range1 o15) (not (< i2 (- o15 1))))))))))))))))))))))))))))))))))))))))))))
  (and
  (and (and (and (= spark__branch1 spark__branch) (= a2 a)) (= i2 i1))
  (= j1 j)) (= y1 y))))

(declare-const o6 Int)

;; Ensures
  (assert (= (to_rep a__last) o6))

(declare-const o7 Int)

;; Ensures
  (assert (= (to_rep a__first) o7))

(define-fun o8 () Int (length o7 o6))

;; Ensures
  (assert (in_range1 o8))

(declare-const spark__branch2 Bool)

;; H
  (assert (= spark__branch2 (ite (= i2 (- o8 1)) true false)))

;; H
  (assert (= spark__branch2 true))

;; Assert
  (assert (and (<= (to_rep a__first) i2) (<= i2 (to_rep a__last))))

(declare-const o9 Int)

;; Ensures
  (assert (= (to_rep (select a2 i2)) o9))

(declare-const y2 Int)

;; H
  (assert (= y2 o9))

(define-fun o10 () Int (- i2 1))

;; Ensures
  (assert (in_range1 o10))

(declare-const j2 Int)

;; H
  (assert (= j2 o10))

(declare-const o11 Bool)

(declare-const o12 Int)

;; H
  (assert
  (ite (<= 0 j2)
  (and (and (<= (to_rep a__first) j2) (<= j2 (to_rep a__last)))
  (and (= (to_rep (select a2 j2)) o12) (= o11 (ite (< y2 o12) true false))))
  (= o11 false)))

;; H
  (assert (= o11 true))

;; Ensures
  (assert (in_range2 j2))

(define-fun o13 () Int (+ j2 1))

;; Ensures
  (assert (in_range1 o13))

;; Ensures
  (assert (in_range2 o13))

(define-fun o14 () integer a__last)

(define-fun o15 () integer a__first)

(declare-const a3 (Array Int integer))

(declare-const o16 (Array Int integer))

;; H
  (assert (= o16 a3))

;; H
  (assert
  (= (is_perm (of_array a2 (to_rep o15) (to_rep o14))
     (of_array o16 (to_rep o15) (to_rep o14))) true))

;; H
  (assert (= (to_rep (select o16 o13)) (to_rep (select a2 j2))))

;; H
  (assert (= (to_rep (select o16 j2)) (to_rep (select a2 o13))))

;; H
  (assert
  (forall ((z1 Int))
  (=> (and (<= (to_rep o15) z1) (<= z1 (to_rep o14)))
  (=> (and (not (= z1 o13)) (not (= z1 j2)))
  (= (to_rep (select o16 z1)) (to_rep (select a2 z1)))))))

;; H
  (assert (= (to_rep o15) 0))

(assert
;; defqtvc
 ;; File "pair_insertion_sort.ads", line 13, characters 0-0
  (not (= (to_rep a__first) 0)))
(check-sat)
