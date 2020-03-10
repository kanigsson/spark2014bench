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

(declare-datatypes ((positive__ref 0))
(((positive__refqtmk (positive__content positive)))))
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
  (! (=> (in_range1 f)
     (=> (in_range1 l)
     (and (= (to_rep1 (first (mk f l))) f) (= (to_rep1 (last (mk f l))) l)))) :pattern (
  (mk f l)) )))

(define-fun dynamic_property ((range_first Int) (range_last Int) (low Int)
  (high Int)) Bool (and (in_range1 low)
                   (and (in_range1 high)
                   (=> (<= low high) (and (in_range4 low) (in_range4 high))))))

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

(declare-fun user_eq4 (us_t us_t) Bool)

(declare-const dummy4 us_t)

(declare-datatypes ((nat_array__ref 0))
(((nat_array__refqtmk (nat_array__content us_t)))))
(define-fun nat_array__ref_nat_array__content__projection ((a nat_array__ref)) us_t 
  (nat_array__content a))

(declare-fun remove (us_t Int) us_t)

(declare-fun remove__function_guard (us_t us_t Int) Bool)

(declare-fun invariant__ (us_t) Bool)

(declare-fun invariant____function_guard (Bool us_t) Bool)

(define-fun dynamic_invariant2 ((temp___expr_167 Int)
  (temp___is_init_163 Bool) (temp___skip_constant_164 Bool)
  (temp___do_toplevel_165 Bool)
  (temp___do_typ_inv_166 Bool)) Bool (=>
                                     (or (= temp___is_init_163 true)
                                     (<= 1 100)) (in_range4 temp___expr_167)))

(define-fun dynamic_invariant3 ((temp___expr_174 us_t)
  (temp___is_init_170 Bool) (temp___skip_constant_171 Bool)
  (temp___do_toplevel_172 Bool)
  (temp___do_typ_inv_173 Bool)) Bool (=>
                                     (not (= temp___skip_constant_171 true))
                                     (dynamic_property 1 100
                                     (first1 temp___expr_174)
                                     (last1 temp___expr_174))))

;; remove__post_axiom
  (assert
  (forall ((a us_t))
  (forall ((i Int))
  (! (and
     (forall ((a1 us_t)) (invariant____function_guard (invariant__ a1) a1))
     (=>
     (and
     (and (dynamic_invariant3 a true true true true) (dynamic_invariant2 i
     true true true true))
     (and (= (invariant__ a) true) (and (<= (first1 a) i) (<= i (last1 a)))))
     (let ((result (remove a i)))
     (and
     (forall ((result1 us_t)) (invariant____function_guard
     (invariant__ result1) result1))
     (=> (remove__function_guard result a i)
     (and
     (and
     (and
     (and
     (and (= (invariant__ result) true) (= (last1 result) (- (last1 a) 1)))
     (forall ((k Int))
     (=> (and (<= 1 k) (<= k (- i 1)))
     (= (to_rep (select (to_array a) k)) (to_rep
                                         (select (to_array result) k))))))
     (forall ((k Int))
     (=> (and (<= (+ i 1) k) (<= k (last1 a)))
     (= (to_rep (select (to_array a) k)) (to_rep
                                         (select (to_array result) (- k 1)))))))
     (forall ((k Int))
     (=> (and (<= i k) (<= k (- (last1 a) 1)))
     (= (to_rep (select (to_array a) (+ k 1))) (to_rep
                                               (select (to_array result) k))))))
     (dynamic_invariant3 result true false true true))))))) :pattern (
  (remove a i)) ))))

(declare-fun is_perm (us_t us_t) Bool)

(declare-fun is_perm__function_guard (Bool us_t us_t) Bool)

;; is_perm__def_axiom
  (assert
  (forall ((a us_t) (b us_t))
  (! (=> (is_perm__function_guard (is_perm a b) a b)
     (and
     (forall ((a1 us_t) (ia Int)) (remove__function_guard (remove a1 ia) a1
     ia))
     (and
     (forall ((b1 us_t) (ib Int)) (remove__function_guard (remove b1 ib) b1
     ib))
     (and
     (forall ((a1 us_t) (ia Int)) (remove__function_guard (remove a1 ia) a1
     ia))
     (and
     (forall ((b1 us_t) (ib Int)) (remove__function_guard (remove b1 ib) b1
     ib))
     (and
     (forall ((a1 us_t) (b1 us_t) (ia Int) (ib Int)) (is_perm__function_guard
     (is_perm (remove a1 ia) (remove b1 ib)) (remove a1 ia) (remove b1 ib)))
     (= (= (is_perm a b) true)
     (or (and (= (length a) 0) (= (length b) 0))
     (exists ((ia Int))
     (and (and (<= (first1 a) ia) (<= ia (last1 a)))
     (exists ((ib Int))
     (and (and (<= (first1 b) ib) (<= ib (last1 b)))
     (and
     (= (to_rep (select (to_array a) ia)) (to_rep (select (to_array b) ib)))
     (= (is_perm (remove a ia) (remove b ib)) true)))))))))))))) :pattern (
  (is_perm a b)) )))

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const x Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const y Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-const init (Array Int natural))

(declare-const attr__ATTRIBUTE_ADDRESS4 Int)

(declare-const attr__ATTRIBUTE_ADDRESS5 Int)

(declare-const attr__ATTRIBUTE_ADDRESS6 Int)

(declare-const attr__ATTRIBUTE_ADDRESS7 Int)

(declare-fun remove_eq (us_t us_t Int) Int)

(declare-fun remove_eq__function_guard (Int us_t us_t Int) Bool)

(declare-sort true_bool 0)

(define-fun in_range5 ((x1 Int)) Bool (and (<= 1 x1) (<= x1 1)))

(declare-fun attr__ATTRIBUTE_IMAGE5 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check5 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE5 (us_image) Int)

(declare-fun user_eq5 (true_bool true_bool) Bool)

(declare-const dummy5 true_bool)

(declare-datatypes ((true_bool__ref 0))
(((true_bool__refqtmk (true_bool__content true_bool)))))
(define-fun true_bool__ref_true_bool__content__projection ((a true_bool__ref)) true_bool 
  (true_bool__content a))

(define-fun dynamic_invariant4 ((temp___expr_218 Int)
  (temp___is_init_214 Bool) (temp___skip_constant_215 Bool)
  (temp___do_toplevel_216 Bool)
  (temp___do_typ_inv_217 Bool)) Bool (=>
                                     (or (= temp___is_init_214 true)
                                     (<= 1 1)) (in_range5 temp___expr_218)))

;; remove_eq__post_axiom
  (assert
  (forall ((a us_t) (b us_t))
  (forall ((i Int))
  (! (and
     (forall ((a1 us_t)) (invariant____function_guard (invariant__ a1) a1))
     (and
     (forall ((b1 us_t)) (invariant____function_guard (invariant__ b1) b1))
     (=>
     (and
     (and
     (and (dynamic_invariant3 a true true true true) (dynamic_invariant3 b
     true true true true)) (dynamic_invariant2 i true true true true))
     (and
     (and (and (= (invariant__ a) true) (= (invariant__ b) true))
     (and (<= (first1 a) i) (<= i (last1 a))))
     (= (bool_eq (to_array a) (first1 a) (last1 a) (to_array b) (first1 b)
        (last1 b)) true)))
     (let ((result (remove_eq a b i)))
     (and
     (forall ((b1 us_t) (i1 Int)) (remove__function_guard (remove b1 i1) b1
     i1))
     (and
     (forall ((a1 us_t) (i1 Int)) (remove__function_guard (remove a1 i1) a1
     i1))
     (=> (remove_eq__function_guard result a b i)
     (and
     (=> (= (distinct result 0) true)
     (= (let ((temp___242 (remove b i)))
        (let ((temp___241 (remove a i)))
        (bool_eq (to_array temp___241) (first1 temp___241) (last1 temp___241)
        (to_array temp___242) (first1 temp___242) (last1 temp___242)))) true))
     (dynamic_invariant4 result true false true true))))))))) :pattern (
  (remove_eq a b i)) ))))

(declare-fun remove_swap (us_t Int Int) Int)

(declare-fun remove_swap__function_guard (Int us_t Int Int) Bool)

;; remove_swap__post_axiom
  (assert
  (forall ((a us_t))
  (forall ((i1 Int) (i2 Int))
  (! (and
     (forall ((a1 us_t)) (invariant____function_guard (invariant__ a1) a1))
     (=>
     (and
     (and
     (and (dynamic_invariant3 a true true true true) (dynamic_invariant2 i1
     true true true true)) (dynamic_invariant2 i2 true true true true))
     (and
     (and
     (and (= (invariant__ a) true)
     (and (<= (first1 a) i1) (<= i1 (last1 a))))
     (and (<= (first1 a) i2) (<= i2 (last1 a)))) (< i1 i2)))
     (let ((result (remove_swap a i1 i2)))
     (and
     (forall ((a1 us_t) (i21 Int)) (remove__function_guard (remove a1 i21) a1
     i21))
     (and
     (forall ((a1 us_t) (i21 Int)) (remove__function_guard (remove a1 i21) a1
     i21))
     (and
     (forall ((a1 us_t) (i11 Int) (i21 Int)) (remove__function_guard
     (remove (remove a1 i21) i11) (remove a1 i21) i11))
     (and
     (forall ((a1 us_t) (i11 Int)) (remove__function_guard (remove a1 i11) a1
     i11))
     (and
     (forall ((a1 us_t) (i11 Int)) (remove__function_guard (remove a1 i11) a1
     i11))
     (and
     (forall ((a1 us_t) (i11 Int) (i21 Int)) (remove__function_guard
     (remove (remove a1 i11) (- i21 1)) (remove a1 i11) (- i21 1)))
     (=> (remove_swap__function_guard result a i1 i2)
     (and
     (=> (= (distinct result 0) true)
     (= (let ((temp___263 (remove (remove a i2) i1)))
        (let ((temp___262 (remove (remove a i1) (- i2 1))))
        (bool_eq (to_array temp___262) (first1 temp___262) (last1 temp___262)
        (to_array temp___263) (first1 temp___263) (last1 temp___263)))) true))
     (dynamic_invariant4 result true false true true)))))))))))) :pattern (
  (remove_swap a i1 i2)) ))))

(declare-fun perm_reflexive (us_t us_t) Int)

(declare-fun perm_reflexive__function_guard (Int us_t us_t) Bool)

;; perm_reflexive__post_axiom
  (assert
  (forall ((a us_t) (b us_t))
  (! (and
     (forall ((a1 us_t)) (invariant____function_guard (invariant__ a1) a1))
     (and
     (forall ((b1 us_t)) (invariant____function_guard (invariant__ b1) b1))
     (=>
     (and
     (and (dynamic_invariant3 a true true true true) (dynamic_invariant3 b
     true true true true))
     (and (and (= (invariant__ a) true) (= (invariant__ b) true))
     (= (bool_eq (to_array a) (first1 a) (last1 a) (to_array b) (first1 b)
        (last1 b)) true)))
     (let ((result (perm_reflexive a b)))
     (and
     (forall ((a1 us_t) (b1 us_t)) (is_perm__function_guard (is_perm a1 b1)
     a1 b1))
     (=> (perm_reflexive__function_guard result a b)
     (and (=> (= (distinct result 0) true) (= (is_perm a b) true))
     (dynamic_invariant4 result true false true true)))))))) :pattern (
  (perm_reflexive a b)) )))

(declare-fun perm_transitive (us_t us_t us_t) Int)

(declare-fun perm_transitive__function_guard (Int us_t us_t us_t) Bool)

;; perm_transitive__post_axiom
  (assert
  (forall ((a us_t) (b us_t) (c us_t))
  (! (and
     (forall ((a1 us_t)) (invariant____function_guard (invariant__ a1) a1))
     (and
     (forall ((b1 us_t)) (invariant____function_guard (invariant__ b1) b1))
     (and
     (forall ((c1 us_t)) (invariant____function_guard (invariant__ c1) c1))
     (and
     (forall ((a1 us_t) (b1 us_t)) (is_perm__function_guard (is_perm a1 b1)
     a1 b1))
     (and
     (forall ((b1 us_t) (c1 us_t)) (is_perm__function_guard (is_perm b1 c1)
     b1 c1))
     (=>
     (and
     (and
     (and (dynamic_invariant3 a true true true true) (dynamic_invariant3 b
     true true true true)) (dynamic_invariant3 c true true true true))
     (and
     (and
     (and (and (= (invariant__ a) true) (= (invariant__ b) true))
     (= (invariant__ c) true)) (= (is_perm a b) true))
     (= (is_perm b c) true)))
     (let ((result (perm_transitive a b c)))
     (and
     (forall ((a1 us_t) (c1 us_t)) (is_perm__function_guard (is_perm a1 c1)
     a1 c1))
     (=> (perm_transitive__function_guard result a b c)
     (and (=> (= (distinct result 0) true) (= (is_perm a c) true))
     (dynamic_invariant4 result true false true true))))))))))) :pattern (
  (perm_transitive a b c)) )))

(declare-const attr__ATTRIBUTE_ADDRESS8 Int)

(declare-sort tarray_typeP1 0)

(declare-fun tarray_typeP1qtint (tarray_typeP1) Int)

;; tarray_typeP1'axiom
  (assert
  (forall ((i tarray_typeP1))
  (and (<= 1 (tarray_typeP1qtint i)) (<= (tarray_typeP1qtint i) 100))))

(define-fun in_range6 ((x1 Int)) Bool (and (<= 1 x1) (<= x1 100)))

(declare-fun attr__ATTRIBUTE_IMAGE6 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check6 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE6 (us_image) Int)

(declare-fun user_eq6 (tarray_typeP1 tarray_typeP1) Bool)

(declare-const dummy6 tarray_typeP1)

(declare-datatypes ((tarray_typeP1__ref 0))
(((tarray_typeP1__refqtmk (tarray_typeP1__content tarray_typeP1)))))
(define-fun tarray_typeP1__ref_tarray_typeP1__content__projection ((a tarray_typeP1__ref)) tarray_typeP1 
  (tarray_typeP1__content a))

(define-fun dynamic_invariant5 ((temp___expr_39 Int) (temp___is_init_35 Bool)
  (temp___skip_constant_36 Bool) (temp___do_toplevel_37 Bool)
  (temp___do_typ_inv_38 Bool)) Bool (=>
                                    (or (= temp___is_init_35 true)
                                    (<= 0 2147483647)) (in_range2
                                    temp___expr_39)))

;; invariant____post_axiom
  (assert true)

;; invariant____def_axiom
  (assert
  (forall ((a us_t))
  (! (= (= (invariant__ a) true) (and (= (first1 a) 1) (<= 0 (last1 a)))) :pattern (
  (invariant__ a)) )))

;; is_perm__post_axiom
  (assert
  (forall ((a us_t)) (invariant____function_guard (invariant__ a) a)))

(assert
;; defqtvc
 ;; File "sort.adb", line 6, characters 0-0
  (not
  (forall ((values (Array Int natural)) (temp Int) (hr Int) (hr1 Int) (o Int)
  (temp1 Int) (o1 Int) (o2 natural) (values1 (Array Int natural))
  (interm (Array Int natural)) (o3 natural) (values2 (Array Int natural))
  (spark__branch Bool))
  (=> (dynamic_invariant1 x true false true true)
  (=> (dynamic_invariant1 y true false true true)
  (=> (<= 1 x)
  (=> (<= x 100)
  (=> (<= 1 y)
  (=> (<= y 100)
  (=> (not (= x y))
  (=> (dynamic_invariant temp false false true true)
  (=> (= values init)
  (=> (dynamic_invariant4 hr false false true true)
  (=> (<= 1 x)
  (=> (<= x 100)
  (=> (= (to_rep (select values x)) o)
  (=> (= temp1 o)
  (=> (<= 1 y)
  (=> (<= y 100)
  (=> (= (to_rep (select values y)) o1)
  (=> (= (to_rep o2) o1)
  (=> (<= 1 x)
  (=> (<= x 100)
  (=> (= values1 (store values x o2))
  (=> (= interm values1)
  (=>
  (forall ((interm1 (Array Int natural))) (remove__function_guard
  (remove (of_array interm1 1 100) x) (of_array interm1 1 100) x))
  (=> (remove__function_guard (remove (of_array init 1 100) x)
  (of_array init 1 100) x)
  (=>
  (= (let ((temp___320 (remove (of_array interm 1 100) x)))
     (let ((temp___319 (remove (of_array init 1 100) x)))
     (bool_eq (to_array temp___319) (first1 temp___319) (last1 temp___319)
     (to_array temp___320) (first1 temp___320) (last1 temp___320)))) true)
  (=> (in_range2 temp1)
  (=> (= (to_rep o3) temp1)
  (=> (<= 1 y)
  (=> (<= y 100)
  (=> (= values2 (store values1 y o3))
  (=>
  (forall ((values3 (Array Int natural))) (remove__function_guard
  (remove (of_array values3 1 100) y) (of_array values3 1 100) y))
  (=>
  (forall ((interm1 (Array Int natural))) (remove__function_guard
  (remove (of_array interm1 1 100) y) (of_array interm1 1 100) y))
  (=>
  (= (let ((temp___330 (remove (of_array values2 1 100) y)))
     (let ((temp___329 (remove (of_array interm 1 100) y)))
     (bool_eq (to_array temp___329) (first1 temp___329) (last1 temp___329)
     (to_array temp___330) (first1 temp___330) (last1 temp___330)))) true)
  (=> (= spark__branch (ite (< y x) true false))
  (=> (not (= spark__branch true))
  (=> (dynamic_invariant4 hr1 false false true true)
  (let ((o4 x))
  (=> (in_range4 o4)
  (let ((o5 y))
  (=> (in_range4 o5)
  (let ((o6 (of_array values2 1 100)))
  (let ((o7 (remove o6 o5)))
  (=> (forall ((o8 us_t)) (invariant____function_guard (invariant__ o8) o8))
  (=>
  (and (remove__function_guard o7 o6 o5)
  (and (dynamic_invariant3 o7 true false true true)
  (and
  (and
  (and (and (= (invariant__ o7) true) (= (last1 o7) (- (last1 o6) 1)))
  (forall ((k Int))
  (=> (and (<= 1 k) (<= k (- o5 1)))
  (= (to_rep (select (to_array o6) k)) (to_rep (select (to_array o7) k))))))
  (forall ((k Int))
  (=> (and (<= (+ o5 1) k) (<= k (last1 o6)))
  (= (to_rep (select (to_array o6) k)) (to_rep
                                       (select (to_array o7) (- k 1)))))))
  (forall ((k Int))
  (=> (and (<= o5 k) (<= k (- (last1 o6) 1)))
  (= (to_rep (select (to_array o6) (+ k 1))) (to_rep
                                             (select (to_array o7) k))))))))
  (let ((o8 y))
  (=> (in_range4 o8)
  (let ((o9 (of_array interm 1 100)))
  (let ((o10 (remove o9 o8)))
  (=>
  (forall ((o11 us_t)) (invariant____function_guard (invariant__ o11) o11))
  (=>
  (and (remove__function_guard o10 o9 o8)
  (and (dynamic_invariant3 o10 true false true true)
  (and
  (and
  (and (and (= (invariant__ o10) true) (= (last1 o10) (- (last1 o9) 1)))
  (forall ((k Int))
  (=> (and (<= 1 k) (<= k (- o8 1)))
  (= (to_rep (select (to_array o9) k)) (to_rep (select (to_array o10) k))))))
  (forall ((k Int))
  (=> (and (<= (+ o8 1) k) (<= k (last1 o9)))
  (= (to_rep (select (to_array o9) k)) (to_rep
                                       (select (to_array o10) (- k 1)))))))
  (forall ((k Int))
  (=> (and (<= o8 k) (<= k (- (last1 o9) 1)))
  (= (to_rep (select (to_array o9) (+ k 1))) (to_rep
                                             (select (to_array o10) k))))))))
  (let ((o11 (remove_eq o10 o7 o4)))
  (=>
  (forall ((o12 Int) (o13 us_t)) (remove__function_guard (remove o13 o12) o13
  o12))
  (=>
  (forall ((o12 Int) (o13 us_t)) (remove__function_guard (remove o13 o12) o13
  o12))
  (=>
  (and (remove_eq__function_guard o11 o10 o7 o4)
  (and (dynamic_invariant4 o11 true false true true)
  (=> (= (distinct o11 0) true)
  (= (let ((temp___230 (remove o7 o4)))
     (let ((temp___229 (remove o10 o4)))
     (bool_eq (to_array temp___229) (first1 temp___229) (last1 temp___229)
     (to_array temp___230) (first1 temp___230) (last1 temp___230)))) true))))
  (let ((o12 y))
  (=> (in_range4 o12)
  (=> (in_range4 x) (<= (first1 (of_array interm 1 100)) o12)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
(check-sat)
(exit)
