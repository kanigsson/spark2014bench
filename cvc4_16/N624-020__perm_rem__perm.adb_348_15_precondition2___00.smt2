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

(declare-fun invariant__ (us_t) Bool)

(declare-fun invariant____function_guard (Bool us_t) Bool)

(define-fun dynamic_invariant ((temp___expr_222 us_t)
  (temp___is_init_218 Bool) (temp___skip_constant_219 Bool)
  (temp___do_toplevel_220 Bool)
  (temp___do_typ_inv_221 Bool)) Bool (=>
                                     (not (= temp___skip_constant_219 true))
                                     (dynamic_property 1 100
                                     (first1 temp___expr_222)
                                     (last1 temp___expr_222))))

;; invariant____post_axiom
  (assert true)

;; invariant____def_axiom
  (assert
  (forall ((a us_t))
  (! (= (= (invariant__ a) true) (and (= (first1 a) 1) (<= 0 (last1 a)))) :pattern (
  (invariant__ a)) )))

(declare-fun remove (us_t Int) us_t)

(declare-fun remove__function_guard (us_t us_t Int) Bool)

(define-fun dynamic_invariant1 ((temp___expr_215 Int)
  (temp___is_init_211 Bool) (temp___skip_constant_212 Bool)
  (temp___do_toplevel_213 Bool)
  (temp___do_typ_inv_214 Bool)) Bool (=>
                                     (or (= temp___is_init_211 true)
                                     (<= 1 100)) (in_range3 temp___expr_215)))

;; remove__post_axiom
  (assert
  (forall ((a us_t))
  (forall ((i Int))
  (! (and
     (forall ((a1 us_t)) (invariant____function_guard (invariant__ a1) a1))
     (=>
     (and
     (and (dynamic_invariant a true true true true) (dynamic_invariant1 i
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
     (dynamic_invariant result true false true true))))))) :pattern (
  (remove a i)) ))))

(declare-fun remove_swap (us_t Int Int) Int)

(declare-fun remove_swap__function_guard (Int us_t Int Int) Bool)

(declare-sort true_bool 0)

(define-fun in_range4 ((x Int)) Bool (and (<= 1 x) (<= x 1)))

(declare-fun attr__ATTRIBUTE_IMAGE4 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) Int)

(declare-fun user_eq4 (true_bool true_bool) Bool)

(declare-const dummy4 true_bool)

(declare-datatypes ((true_bool__ref 0))
(((true_bool__refqtmk (true_bool__content true_bool)))))
(define-fun true_bool__ref_true_bool__content__projection ((a true_bool__ref)) true_bool 
  (true_bool__content a))

(define-fun dynamic_invariant2 ((temp___expr_208 Int)
  (temp___is_init_204 Bool) (temp___skip_constant_205 Bool)
  (temp___do_toplevel_206 Bool)
  (temp___do_typ_inv_207 Bool)) Bool (=>
                                     (or (= temp___is_init_204 true)
                                     (<= 1 1)) (in_range4 temp___expr_208)))

;; remove_swap__post_axiom
  (assert
  (forall ((a us_t))
  (forall ((i1 Int) (i2 Int))
  (! (and
     (forall ((a1 us_t)) (invariant____function_guard (invariant__ a1) a1))
     (=>
     (and
     (and
     (and (dynamic_invariant a true true true true) (dynamic_invariant1 i1
     true true true true)) (dynamic_invariant1 i2 true true true true))
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
     (= (let ((temp___252 (remove (remove a i2) i1)))
        (let ((temp___251 (remove (remove a i1) (- i2 1))))
        (bool_eq (to_array temp___251) (first1 temp___251) (last1 temp___251)
        (to_array temp___252) (first1 temp___252) (last1 temp___252)))) true))
     (dynamic_invariant2 result true false true true)))))))))))) :pattern (
  (remove_swap a i1 i2)) ))))

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

(declare-fun perm_symmetric (us_t us_t) Int)

(declare-fun perm_symmetric__function_guard (Int us_t us_t) Bool)

;; perm_symmetric__post_axiom
  (assert
  (forall ((a us_t) (b us_t))
  (! (and
     (forall ((a1 us_t)) (invariant____function_guard (invariant__ a1) a1))
     (and
     (forall ((b1 us_t)) (invariant____function_guard (invariant__ b1) b1))
     (and
     (forall ((a1 us_t) (b1 us_t)) (is_perm__function_guard (is_perm a1 b1)
     a1 b1))
     (=>
     (and
     (and (dynamic_invariant a true true true true) (dynamic_invariant b true
     true true true))
     (and (and (= (invariant__ a) true) (= (invariant__ b) true))
     (= (is_perm a b) true)))
     (let ((result (perm_symmetric a b)))
     (and
     (forall ((a1 us_t) (b1 us_t)) (is_perm__function_guard (is_perm b1 a1)
     b1 a1))
     (=> (perm_symmetric__function_guard result a b)
     (and (=> (= (distinct result 0) true) (= (is_perm b a) true))
     (dynamic_invariant2 result true false true true))))))))) :pattern (
  (perm_symmetric a b)) )))

(declare-const a us_t)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const b us_t)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const ia Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const ib Int)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-fun get_witness (us_t us_t Int) Int)

(declare-fun get_witness__function_guard (Int us_t us_t Int) Bool)

;; get_witness__post_axiom
  (assert
  (forall ((a1 us_t) (b1 us_t))
  (forall ((ia1 Int))
  (! (and
     (forall ((a2 us_t)) (invariant____function_guard (invariant__ a2) a2))
     (and
     (forall ((b2 us_t)) (invariant____function_guard (invariant__ b2) b2))
     (and
     (forall ((a2 us_t) (ia2 Int)) (remove__function_guard (remove a2 ia2) a2
     ia2))
     (and
     (forall ((b2 us_t) (ib1 Int)) (remove__function_guard (remove b2 ib1) b2
     ib1))
     (and
     (forall ((a2 us_t) (ia2 Int)) (remove__function_guard (remove a2 ia2) a2
     ia2))
     (and
     (forall ((b2 us_t) (ib1 Int)) (remove__function_guard (remove b2 ib1) b2
     ib1))
     (and
     (forall ((a2 us_t) (b2 us_t) (ia2 Int) (ib1 Int))
     (is_perm__function_guard (is_perm (remove a2 ia2) (remove b2 ib1))
     (remove a2 ia2) (remove b2 ib1)))
     (=>
     (and
     (and
     (and (dynamic_invariant a1 true true true true) (dynamic_invariant b1
     true true true true)) (dynamic_invariant1 ia1 true true true true))
     (and
     (and (and (= (invariant__ a1) true) (= (invariant__ b1) true))
     (and (<= (first1 a1) ia1) (<= ia1 (last1 a1))))
     (exists ((ib1 Int))
     (and (and (<= (first1 b1) ib1) (<= ib1 (last1 b1)))
     (and
     (= (to_rep (select (to_array a1) ia1)) (to_rep
                                            (select (to_array b1) ib1)))
     (= (is_perm (remove a1 ia1) (remove b1 ib1)) true))))))
     (let ((result (get_witness a1 b1 ia1)))
     (and
     (forall ((a2 us_t) (ia2 Int)) (remove__function_guard (remove a2 ia2) a2
     ia2))
     (and
     (forall ((b2 us_t) (result1 Int)) (remove__function_guard
     (remove b2 result1) b2 result1))
     (and
     (forall ((a2 us_t) (ia2 Int)) (remove__function_guard (remove a2 ia2) a2
     ia2))
     (and
     (forall ((b2 us_t) (result1 Int)) (remove__function_guard
     (remove b2 result1) b2 result1))
     (and
     (forall ((a2 us_t) (b2 us_t) (ia2 Int) (result1 Int))
     (is_perm__function_guard (is_perm (remove a2 ia2) (remove b2 result1))
     (remove a2 ia2) (remove b2 result1)))
     (=> (get_witness__function_guard result a1 b1 ia1)
     (and
     (and
     (and (and (<= (first1 b1) result) (<= result (last1 b1)))
     (= (to_rep (select (to_array a1) ia1)) (to_rep
                                            (select (to_array b1) result))))
     (= (is_perm (remove a1 ia1) (remove b1 result)) true))
     (dynamic_invariant1 result true false true true))))))))))))))))) :pattern (
  (get_witness a1 b1 ia1)) ))))

(declare-fun shift_perm_l (us_t us_t us_t) Int)

(declare-fun shift_perm_l__function_guard (Int us_t us_t us_t) Bool)

;; shift_perm_l__post_axiom
  (assert
  (forall ((a1 us_t) (b1 us_t) (c us_t))
  (! (and
     (forall ((a2 us_t)) (invariant____function_guard (invariant__ a2) a2))
     (and
     (forall ((b2 us_t)) (invariant____function_guard (invariant__ b2) b2))
     (and
     (forall ((c1 us_t)) (invariant____function_guard (invariant__ c1) c1))
     (and
     (forall ((a2 us_t) (b2 us_t)) (is_perm__function_guard (is_perm a2 b2)
     a2 b2))
     (=>
     (and
     (and
     (and (dynamic_invariant a1 true true true true) (dynamic_invariant b1
     true true true true)) (dynamic_invariant c true true true true))
     (and
     (and
     (and (and (= (invariant__ a1) true) (= (invariant__ b1) true))
     (= (invariant__ c) true))
     (= (bool_eq (to_array a1) (first1 a1) (last1 a1) (to_array c) (first1 c)
        (last1 c)) true))
     (= (is_perm a1 b1) true)))
     (let ((result (shift_perm_l a1 b1 c)))
     (and
     (forall ((b2 us_t) (c1 us_t)) (is_perm__function_guard (is_perm c1 b2)
     c1 b2))
     (=> (shift_perm_l__function_guard result a1 b1 c)
     (and (=> (= (distinct result 0) true) (= (is_perm c b1) true))
     (dynamic_invariant2 result true false true true)))))))))) :pattern (
  (shift_perm_l a1 b1 c)) )))

(declare-fun extended_perm (us_t us_t) Int)

(declare-fun extended_perm__function_guard (Int us_t us_t) Bool)

;; extended_perm__post_axiom
  (assert
  (forall ((a1 us_t) (b1 us_t)) (! (in_range4
  (extended_perm a1 b1)) :pattern ((extended_perm a1 b1)) )))

(declare-const attr__ATTRIBUTE_ADDRESS4 Int)

(declare-const ib2 Int)

(declare-const attr__ATTRIBUTE_ADDRESS5 Int)

(declare-const aa us_t)

(declare-const attr__ATTRIBUTE_ADDRESS6 Int)

(declare-const bb us_t)

(declare-const attr__ATTRIBUTE_ADDRESS7 Int)

(declare-const bb2 us_t)

(declare-const attr__ATTRIBUTE_ADDRESS8 Int)

(declare-const attr__ATTRIBUTE_ADDRESS9 Int)

(define-fun dynamic_invariant3 ((temp___expr_39 Int) (temp___is_init_35 Bool)
  (temp___skip_constant_36 Bool) (temp___do_toplevel_37 Bool)
  (temp___do_typ_inv_38 Bool)) Bool (=>
                                    (or (= temp___is_init_35 true)
                                    (<= 0 2147483647)) (in_range1
                                    temp___expr_39)))

(define-fun dynamic_invariant4 ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647))
                                    (in_range2 temp___expr_18)))

;; ib2__def_axiom
  (assert
  (and (get_witness__function_guard (get_witness a b ia) a b ia)
  (= ib2 (get_witness a b ia))))

;; aa__def_axiom
  (assert
  (and (remove__function_guard (remove a ia) a ia) (= aa (remove a ia))))

;; bb__def_axiom
  (assert
  (and (remove__function_guard (remove b ib) b ib) (= bb (remove b ib))))

;; bb2__def_axiom
  (assert
  (and (remove__function_guard (remove b ib2) b ib2) (= bb2 (remove b ib2))))

;; is_perm__post_axiom
  (assert
  (forall ((a1 us_t)) (invariant____function_guard (invariant__ a1) a1)))

(assert
;; defqtvc
 ;; File "perm.ads", line 57, characters 0-0
  (not
  (forall ((ia2 Int))
  (=> (dynamic_invariant a true false true true)
  (=> (dynamic_invariant b true false true true)
  (=> (dynamic_invariant1 ia true false true true)
  (=> (dynamic_invariant1 ib true false true true)
  (=> (invariant____function_guard (invariant__ a) a)
  (=> (= (invariant__ a) true)
  (=> (invariant____function_guard (invariant__ b) b)
  (=> (= (invariant__ b) true)
  (=> (<= (first1 a) ia)
  (=> (<= ia (last1 a))
  (=> (<= (first1 b) ib)
  (=> (<= ib (last1 b))
  (=> (is_perm__function_guard (is_perm a b) a b)
  (=> (= (is_perm a b) true)
  (=> (= (to_rep (select (to_array a) ia)) (to_rep (select (to_array b) ib)))
  (let ((o b))
  (let ((o1 a))
  (let ((o2 (extended_perm o1 o)))
  (=>
  (forall ((o3 us_t) (ia3 Int)) (remove__function_guard (remove o3 ia3) o3
  ia3))
  (=>
  (forall ((o3 us_t) (ib3 Int)) (remove__function_guard (remove o3 ib3) o3
  ib3))
  (=>
  (forall ((o3 us_t) (ia3 Int)) (remove__function_guard (remove o3 ia3) o3
  ia3))
  (=>
  (forall ((o3 us_t) (ib3 Int)) (remove__function_guard (remove o3 ib3) o3
  ib3))
  (=>
  (forall ((o3 us_t) (o4 us_t) (ia3 Int) (ib3 Int)) (is_perm__function_guard
  (is_perm (remove o4 ia3) (remove o3 ib3)) (remove o4 ia3) (remove o3 ib3)))
  (=>
  (and (extended_perm__function_guard o2 o1 o)
  (and (dynamic_invariant2 o2 true false true true)
  (=> (= (distinct o2 0) true)
  (forall ((ia3 Int))
  (=> (and (<= (first1 o1) ia3) (<= ia3 (last1 o1)))
  (exists ((ib3 Int))
  (and (and (<= (first1 o) ib3) (<= ib3 (last1 o)))
  (and
  (= (to_rep (select (to_array o1) ia3)) (to_rep (select (to_array o) ib3)))
  (= (is_perm (remove o1 ia3) (remove o ib3)) true)))))))))
  (forall ((h Int))
  (=> (= h o2)
  (=> (dynamic_invariant2 h true false true true)
  (let ((o3 ia))
  (let ((o4 b))
  (let ((o5 a))
  (let ((perm__remove_perm__ib2__assume (get_witness o5 o4 o3)))
  (=>
  (forall ((o6 Int) (o7 us_t)) (remove__function_guard (remove o7 o6) o7 o6))
  (=>
  (forall ((o6 us_t) (perm__remove_perm__ib2__assume1 Int))
  (remove__function_guard (remove o6 perm__remove_perm__ib2__assume1) o6
  perm__remove_perm__ib2__assume1))
  (=>
  (forall ((o6 Int) (o7 us_t)) (remove__function_guard (remove o7 o6) o7 o6))
  (=>
  (forall ((o6 us_t) (perm__remove_perm__ib2__assume1 Int))
  (remove__function_guard (remove o6 perm__remove_perm__ib2__assume1) o6
  perm__remove_perm__ib2__assume1))
  (=>
  (forall ((o6 Int) (o7 us_t) (o8 us_t)
  (perm__remove_perm__ib2__assume1 Int)) (is_perm__function_guard
  (is_perm (remove o8 o6) (remove o7 perm__remove_perm__ib2__assume1))
  (remove o8 o6) (remove o7 perm__remove_perm__ib2__assume1)))
  (=>
  (and (get_witness__function_guard perm__remove_perm__ib2__assume o5 o4 o3)
  (and (dynamic_invariant1 perm__remove_perm__ib2__assume true false true
  true)
  (and
  (and
  (and (<= (first1 o4) perm__remove_perm__ib2__assume)
  (<= perm__remove_perm__ib2__assume (last1 o4)))
  (= (to_rep (select (to_array o5) o3)) (to_rep
                                        (select (to_array o4) perm__remove_perm__ib2__assume))))
  (= (is_perm (remove o5 o3) (remove o4 perm__remove_perm__ib2__assume)) true))))
  (=> (= perm__remove_perm__ib2__assume ib2)
  (=> (dynamic_invariant1 ib2 true false true true)
  (let ((o6 ia))
  (let ((o7 a))
  (let ((perm__remove_perm__aa__assume (remove o7 o6)))
  (=>
  (forall ((perm__remove_perm__aa__assume1 us_t))
  (invariant____function_guard (invariant__ perm__remove_perm__aa__assume1)
  perm__remove_perm__aa__assume1))
  (=>
  (and (remove__function_guard perm__remove_perm__aa__assume o7 o6)
  (and (dynamic_invariant perm__remove_perm__aa__assume true false true true)
  (and
  (and
  (and
  (and (= (invariant__ perm__remove_perm__aa__assume) true)
  (= (last1 perm__remove_perm__aa__assume) (- (last1 o7) 1)))
  (forall ((k Int))
  (=> (and (<= 1 k) (<= k (- o6 1)))
  (= (to_rep (select (to_array o7) k)) (to_rep
                                       (select (to_array
                                               perm__remove_perm__aa__assume) k))))))
  (forall ((k Int))
  (=> (and (<= (+ o6 1) k) (<= k (last1 o7)))
  (= (to_rep (select (to_array o7) k)) (to_rep
                                       (select (to_array
                                               perm__remove_perm__aa__assume) (- k 1)))))))
  (forall ((k Int))
  (=> (and (<= o6 k) (<= k (- (last1 o7) 1)))
  (= (to_rep (select (to_array o7) (+ k 1))) (to_rep
                                             (select (to_array
                                                     perm__remove_perm__aa__assume) k))))))))
  (=> (= perm__remove_perm__aa__assume aa)
  (=> (dynamic_invariant aa true false true true)
  (let ((o8 ib))
  (let ((o9 b))
  (let ((perm__remove_perm__bb__assume (remove o9 o8)))
  (=>
  (forall ((perm__remove_perm__bb__assume1 us_t))
  (invariant____function_guard (invariant__ perm__remove_perm__bb__assume1)
  perm__remove_perm__bb__assume1))
  (=>
  (and (remove__function_guard perm__remove_perm__bb__assume o9 o8)
  (and (dynamic_invariant perm__remove_perm__bb__assume true false true true)
  (and
  (and
  (and
  (and (= (invariant__ perm__remove_perm__bb__assume) true)
  (= (last1 perm__remove_perm__bb__assume) (- (last1 o9) 1)))
  (forall ((k Int))
  (=> (and (<= 1 k) (<= k (- o8 1)))
  (= (to_rep (select (to_array o9) k)) (to_rep
                                       (select (to_array
                                               perm__remove_perm__bb__assume) k))))))
  (forall ((k Int))
  (=> (and (<= (+ o8 1) k) (<= k (last1 o9)))
  (= (to_rep (select (to_array o9) k)) (to_rep
                                       (select (to_array
                                               perm__remove_perm__bb__assume) (- k 1)))))))
  (forall ((k Int))
  (=> (and (<= o8 k) (<= k (- (last1 o9) 1)))
  (= (to_rep (select (to_array o9) (+ k 1))) (to_rep
                                             (select (to_array
                                                     perm__remove_perm__bb__assume) k))))))))
  (=> (= perm__remove_perm__bb__assume bb)
  (=> (dynamic_invariant bb true false true true)
  (let ((o10 ib2))
  (let ((o11 b))
  (let ((perm__remove_perm__bb2__assume (remove o11 o10)))
  (=>
  (forall ((perm__remove_perm__bb2__assume1 us_t))
  (invariant____function_guard (invariant__ perm__remove_perm__bb2__assume1)
  perm__remove_perm__bb2__assume1))
  (=>
  (and (remove__function_guard perm__remove_perm__bb2__assume o11 o10)
  (and (dynamic_invariant perm__remove_perm__bb2__assume true false true
  true)
  (and
  (and
  (and
  (and (= (invariant__ perm__remove_perm__bb2__assume) true)
  (= (last1 perm__remove_perm__bb2__assume) (- (last1 o11) 1)))
  (forall ((k Int))
  (=> (and (<= 1 k) (<= k (- o10 1)))
  (= (to_rep (select (to_array o11) k)) (to_rep
                                        (select (to_array
                                                perm__remove_perm__bb2__assume) k))))))
  (forall ((k Int))
  (=> (and (<= (+ o10 1) k) (<= k (last1 o11)))
  (= (to_rep (select (to_array o11) k)) (to_rep
                                        (select (to_array
                                                perm__remove_perm__bb2__assume) (- k 1)))))))
  (forall ((k Int))
  (=> (and (<= o10 k) (<= k (- (last1 o11) 1)))
  (= (to_rep (select (to_array o11) (+ k 1))) (to_rep
                                              (select (to_array
                                                      perm__remove_perm__bb2__assume) k))))))))
  (=> (= perm__remove_perm__bb2__assume bb2)
  (=> (dynamic_invariant bb2 true false true true)
  (=> (dynamic_invariant1 ia2 false false true true)
  (forall ((spark__branch Bool))
  (=> (= spark__branch (ite (= ib ib2) true false))
  (=> (not (= spark__branch true))
  (let ((o12 bb2))
  (let ((o13 aa))
  (let ((o14 (perm_symmetric o13 o12)))
  (=>
  (forall ((o15 us_t) (o16 us_t)) (is_perm__function_guard (is_perm o15 o16)
  o15 o16))
  (=>
  (and (perm_symmetric__function_guard o14 o13 o12)
  (and (dynamic_invariant2 o14 true false true true)
  (=> (= (distinct o14 0) true) (= (is_perm o12 o13) true))))
  (forall ((h1 Int))
  (=> (= h1 o14)
  (=> (= (distinct h1 0) true)
  (let ((o15 aa))
  (let ((o16 bb2))
  (let ((o17 (extended_perm o16 o15)))
  (=>
  (forall ((o18 us_t) (ia3 Int)) (remove__function_guard (remove o18 ia3) o18
  ia3))
  (=>
  (forall ((o18 us_t) (ib3 Int)) (remove__function_guard (remove o18 ib3) o18
  ib3))
  (=>
  (forall ((o18 us_t) (ia3 Int)) (remove__function_guard (remove o18 ia3) o18
  ia3))
  (=>
  (forall ((o18 us_t) (ib3 Int)) (remove__function_guard (remove o18 ib3) o18
  ib3))
  (=>
  (forall ((o18 us_t) (o19 us_t) (ia3 Int) (ib3 Int))
  (is_perm__function_guard (is_perm (remove o19 ia3) (remove o18 ib3))
  (remove o19 ia3) (remove o18 ib3)))
  (=>
  (and (extended_perm__function_guard o17 o16 o15)
  (and (dynamic_invariant2 o17 true false true true)
  (=> (= (distinct o17 0) true)
  (forall ((ia3 Int))
  (=> (and (<= (first1 o16) ia3) (<= ia3 (last1 o16)))
  (exists ((ib3 Int))
  (and (and (<= (first1 o15) ib3) (<= ib3 (last1 o15)))
  (and
  (= (to_rep (select (to_array o16) ia3)) (to_rep
                                          (select (to_array o15) ib3)))
  (= (is_perm (remove o16 ia3) (remove o15 ib3)) true)))))))))
  (forall ((h2 Int))
  (=> (= h2 o17)
  (=> (= (distinct h2 0) true)
  (forall ((spark__branch1 Bool))
  (=> (= spark__branch1 (ite (< ib ib2) true false))
  (=> (= spark__branch1 true)
  (let ((o18 ib))
  (let ((o19 aa))
  (let ((o20 bb2))
  (let ((o21 (get_witness o20 o19 o18)))
  (=>
  (forall ((o22 Int) (o23 us_t)) (remove__function_guard (remove o23 o22) o23
  o22))
  (=>
  (forall ((o22 us_t) (o23 Int)) (remove__function_guard (remove o22 o23) o22
  o23))
  (=>
  (forall ((o22 Int) (o23 us_t)) (remove__function_guard (remove o23 o22) o23
  o22))
  (=>
  (forall ((o22 us_t) (o23 Int)) (remove__function_guard (remove o22 o23) o22
  o23))
  (=>
  (forall ((o22 Int) (o23 us_t) (o24 us_t) (o25 Int))
  (is_perm__function_guard (is_perm (remove o24 o22) (remove o23 o25))
  (remove o24 o22) (remove o23 o25)))
  (=>
  (and (get_witness__function_guard o21 o20 o19 o18)
  (and (dynamic_invariant1 o21 true false true true)
  (and
  (and (and (<= (first1 o19) o21) (<= o21 (last1 o19)))
  (= (to_rep (select (to_array o20) o18)) (to_rep
                                          (select (to_array o19) o21))))
  (= (is_perm (remove o20 o18) (remove o19 o21)) true))))
  (forall ((ia21 Int)) (=> (= ia21 o21) (<= ib (last1 b))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
(check-sat)
(exit)
